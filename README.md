# RISC-V CPU Project

A from-scratch **RISC-V CPU** built in **SystemVerilog** to learn computer architecture, RTL design, verification, and FPGA development.

## Project Structure

```text
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

```text
obj_dir/rtl/<module>/
```

## Current Progress

- ALU
- Program Counter
- Register File
- Automated Verilator testing

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

```text
rtl/ALU.sv
tb/ALU_tb.sv

obj_dir/rtl/ALU/
```

The test scripts compile and run each module independently, with assertions used to detect incorrect behavior.

## Roadmap

```text
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
