# RISC-V CPU

A from-scratch **RV32I** processor written in **SystemVerilog**, built module by module to learn computer architecture, RTL design, verification, and FPGA development. The target is a single-cycle core that runs real RISC-V programs, first in simulation and eventually on an FPGA.

## Status

| Module        | File                | Testbench                | State                          |
| ------------- | ------------------- | ------------------------ | ------------------------------ |
| ALU           | `rtl/ALU.sv`        | `tb/ALU_tb.sv`           | Done (all RV32I integer ops)   |
| Register file | `rtl/regfile.sv`    | `tb/regfile_tb.sv`       | Done                           |
| Program counter | `rtl/PC.sv`       | `tb/PC_tb.sv`            | Basic version (see below)      |
| ALU decoder   | `rtl/alu_decoder.sv`| `tb/alu_decoder_tb.sv`   | Done (exhaustive test)         |
| Immediate generator | `rtl/imm_gen.sv` | `tb/imm_gen_tb.sv`    | I-type ALU immediates only     |

Not started yet: main control unit, branch/jump logic, instruction memory, data memory, write-back mux, top-level datapath.

## Repository layout

```
.
├── rtl/        CPU modules
├── tb/         one self-checking testbench per module
├── scripts/    automated Verilator build and test runner
└── learning/   basic logic components built while learning SystemVerilog
```

Generated output (`obj_dir/`, waveforms) is created locally and is not part of the source tree.

## Modules

### ALU (`rtl/ALU.sv`)

Purely combinational 32-bit ALU.

| Signal     | Dir    | Width | Description                         |
| ---------- | ------ | ----- | ----------------------------------- |
| `a`        | input  | 32    | First operand (`rs1`)               |
| `b`        | input  | 32    | Second operand (`rs2` or immediate) |
| `alu_ctrl` | input  | 4     | Operation select                    |
| `result`   | output | 32    | Operation result                    |
| `zr`       | output | 1     | High when `result == 0`             |

| `alu_ctrl` | Operation | Description                           |
| ---------- | --------- | ------------------------------------- |
| `4'b0000`  | ADD       | `a + b`                               |
| `4'b0001`  | SUB       | `a - b`                               |
| `4'b0010`  | AND       | `a & b`                               |
| `4'b0011`  | OR        | `a \| b`                              |
| `4'b0100`  | XOR       | `a ^ b`                               |
| `4'b0101`  | SLL       | Logical shift left by `b[4:0]`        |
| `4'b0110`  | SRL       | Logical shift right by `b[4:0]`       |
| `4'b0111`  | SRA       | Arithmetic shift right by `b[4:0]`    |
| `4'b1000`  | SLT       | `1` if `a < b` (signed), else `0`     |
| `4'b1001`  | SLTU      | `1` if `a < b` (unsigned), else `0`   |
| other      | n/a       | Result forced to `0`                  |

Design notes:

- Shift amounts use only `b[4:0]`, as the RV32I spec requires.
- `always_comb` with a default assignment, so no latches are inferred.
- `zr` is derived from `result`, so BEQ/BNE will run the ALU in SUB mode and test `zr`. BLT/BGE/BLTU/BGEU can reuse SLT/SLTU.

### ALU decoder (`rtl/alu_decoder.sv`)

Maps `funct3`, `funct7[5]`, and an `is_rtype` flag to `alu_ctrl`. `is_rtype` is needed because for I-type instructions bit 30 is immediate data: `ADDI` with that bit set must still be ADD, while R-type `SUB` uses it to select subtraction. For shifts, `funct7[5]` selects SRL vs SRA (SRLI/SRAI as well).

### Register file (`rtl/regfile.sv`)

32 x 32-bit registers, two combinational read ports, one synchronous write port gated by `we`. Writes to `x0` are ignored and reads of `x0` always return 0.

### Program counter (`rtl/PC.sv`)

Registered 32-bit counter with `load` (takes `in`) and `inc`. `load` has priority over `inc`.

### Immediate generator (`rtl/imm_gen.sv`)

Sign-extends the I-type immediate for opcode `0010011` (ADDI, SLTI, XORI, ...). Other opcodes currently produce `0`.

## Testing

Every module in `rtl/` must have a matching `tb/<module>_tb.sv`. Testbenches use assertions and exit nonzero on failure. Techniques in use so far include directed tests, golden-reference models, exhaustive sweeps (`alu_decoder`), and `$urandom` randomized stimulus.

Run everything from the project root:

```
./scripts/compile.sh
```

For each module the script builds with `verilator --binary --assert`, runs the simulation into `obj_dir/rtl/<module>/`, and prints a pass/fail summary. A module with no testbench is reported as a failure.

## Tools

SystemVerilog, Verilator, GTKWave, Bash, VS Code, WSL2.

## Known limitations

- `PC.sv` increments by 1 rather than 4 and has no reset input. It needs `+4` and a synchronous reset before it is wired into the datapath.
- `imm_gen.sv` does not yet decode loads, JALR, or the S, B, U, and J formats.

## Roadmap

```
ALU, ALU decoder, regfile, PC, imm_gen   (in progress)
 ↓
Main control unit
 ↓
Branch / jump logic
 ↓
Instruction + data memory, write-back mux
 ↓
Single-cycle datapath integration
 ↓
Verification with riscv-tests / riscv-arch-test
 ↓
FPGA bring-up
```

Possible later extensions: pipelining, CSR support, M extension, UART.