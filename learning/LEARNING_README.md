# Learning — Basic Components

This directory contains the digital logic components built before moving on to the main RISC-V CPU.

The goal is to practice **SystemVerilog**, hardware design, simulation, and verification by building common components from scratch.

## Structure

```text
learning/
├── basic_components/
│   ├── adders/
│   ├── gates/
│   ├── memory/
│   ├── mux/
│   └── tb/
└── scripts/
```

## Components

The learning section includes:

- Basic logic gates
- MUX and DMUX components
- Half adders and full adders
- 32-bit arithmetic components
- Registers
- RAM modules

These components provide the foundation for understanding the larger CPU modules in the main project.

## Testing

Each component has a SystemVerilog testbench under:

```text
learning/basic_components/tb/
```

The scripts in:

```text
learning/scripts/
```

compile and test the components using **Verilator**.

Generated build files are stored separately for each component:

```text
obj_dir/basic_components/<module>/
```

For example:

```text
obj_dir/basic_components/Add32/
obj_dir/basic_components/MUX32/
obj_dir/basic_components/RAM64/
```

Assertions are used in the testbenches to detect incorrect behavior.

## Tools

- SystemVerilog
- Verilator
- GTKWave
- Bash
- VS Code
- WSL2

## Purpose

This section serves as a progression from simple Boolean logic to larger hardware components before integrating them into the RISC-V CPU.
