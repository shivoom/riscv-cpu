# RISC-V CPU Project

A from-scratch **RISC-V CPU** built in **SystemVerilog** to learn computer architecture, RTL design, verification, and FPGA development.

## Project Structure

```
.
├── learning/
├── rtl/
├── scripts/
├── tb/
└── waves/
```

- `rtl/` — main CPU modules
- `tb/` — testbenches for CPU modules
- `scripts/` — automated Verilator build and test scripts
- `waves/` — generated waveform files
- `learning/` — basic digital logic components built while learning SystemVerilog

`obj_dir/` contains generated Verilator build files and is excluded with `.gitignore`.

Each CPU module is compiled into its own directory:

```
obj_dir/rtl/<module>/
```

## Current Progress

- ALU (all RV32I arithmetic/logic operations implemented; testbench in progress)
- Program Counter
- Register File
- Automated Verilator testing

## ALU

`rtl/ALU.sv` is a purely combinational 32-bit ALU covering the RV32I integer operation set. It will sit at the center of the datapath, taking its operands from the register file (or the immediate generator) and producing a result for write-back, address calculation, and branch comparison.

### Interface

| Signal     | Dir    | Width | Description                                  |
| ---------- | ------ | ----- | -------------------------------------------- |
| `a`        | input  | 32    | First operand (`rs1`)                        |
| `b`        | input  | 32    | Second operand (`rs2` or immediate)          |
| `alu_ctrl` | input  | 4     | Selects the operation                        |
| `result`   | output | 32    | Operation result                             |
| `zr`       | output | 1     | High when `result == 0`                      |

### Operations

| `alu_ctrl` | Operation | Description                                   |
| ---------- | --------- | --------------------------------------------- |
| `4'b0000`  | ADD       | `a + b`                                       |
| `4'b0001`  | SUB       | `a - b`                                       |
| `4'b0010`  | XOR       | `a ^ b`                                       |
| `4'b0011`  | OR        | `a \| b`                                      |
| `4'b0100`  | AND       | `a & b`                                       |
| `4'b0101`  | SLL       | Logical shift left by `b[4:0]`                |
| `4'b0110`  | SRL       | Logical shift right by `b[4:0]`               |
| `4'b0111`  | SRA       | Arithmetic shift right by `b[4:0]`            |
| `4'b1000`  | SLT       | `1` if `a < b` (signed), else `0`             |
| `4'b1001`  | SLTU      | `1` if `a < b` (unsigned), else `0`           |
| other      | —         | Result forced to `0`                          |

### Design notes

- **Shift amounts** use only the low 5 bits of `b` (`b[4:0]`), matching the RV32I spec.
- **Signed operations** (SRA, SLT) use `$signed()` casts so the same 32-bit inputs can be interpreted correctly without separate ports.
- **Zero flag** (`zr`) is derived from `result`, and will drive `BEQ`/`BNE` branch decisions once branch logic is added. Comparison branches (`BLT`, `BGE`, etc.) can reuse the SLT/SLTU outputs.
- **Combinational only** — implemented with `always_comb` and a `case` statement with a default, so no latches are inferred.
- `alu_ctrl` is a 4-bit code chosen for this design; the control unit will decode `opcode`/`funct3`/`funct7` into it.

### Verification status

`tb/ALU_tb.sv` is being built out to exercise every operation, with assertions and zero-flag checks. It runs through the same automated Verilator flow as the other modules.

## Tools

- SystemVerilog
- Verilator
- GTKWave
- Bash
- VS Code
- WSL2

## Testing

Each RTL module has a corresponding SystemVerilog testbench.

Example:

```
rtl/ALU.sv
tb/ALU_tb.sv

obj_dir/rtl/ALU/
```

`scripts/compile.sh` loops over every module in `rtl/`, finds its matching `tb/<module>_tb.sv`, builds it with Verilator (`--binary --assert`), runs it, and prints a pass/fail summary. A module with no testbench is reported as a failure. Assertions are used to detect incorrect behavior.

Run all tests from the project root:

```
./scripts/compile.sh
```

## Roadmap

```
ALU
 ↓
Program Counter
 ↓
Register File
 ↓
Instruction Decode
 ↓
Immediate Generation
 ↓
Control Unit
 ↓
Branch / Jump Logic
 ↓
Datapath Integration
 ↓
RISC-V CPU
 ↓
FPGA
```

The long-term goal is to run the completed processor on an FPGA and execute RISC-V programs on physical hardware.