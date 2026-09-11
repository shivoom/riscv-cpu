#!/bin/bash

set -e

PROJECT_ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
BASIC_DIR="$PROJECT_ROOT/learning/basic_components"
TB_DIR="$BASIC_DIR/tb"
BUILD_DIR="$PROJECT_ROOT/obj_dir/basic_components"

echo "================================"
echo "    BASIC COMPONENT TESTS"
echo "================================"
echo ""

passed=0
failed=0
total=0
failed_chips=()

# Find every SystemVerilog component outside of the tb directory
while IFS= read -r chip; do

    name=$(basename "$chip" .sv)
    tb="$TB_DIR/${name}_tb.sv"

    total=$((total + 1))

    echo "--------------------------------"
    echo "Testing: $name"
    echo "--------------------------------"

    # Make sure a testbench exists
    if [ ! -f "$tb" ]; then
        echo "ERROR: No testbench found: $tb"
        failed=$((failed + 1))
        failed_chips+=("$name")
        echo ""
        continue
    fi

    # Give each component its own build directory
    CHIP_BUILD_DIR="$BUILD_DIR/$name"
    mkdir -p "$CHIP_BUILD_DIR"

    # Compile and run
    if verilator --binary \
        --assert \
        "$chip" \
        "$tb" \
        --top-module "${name}_tb" \
        --Mdir "$CHIP_BUILD_DIR" \
        -o "${name}_test"; then

        echo "Running $name..."

        if "$CHIP_BUILD_DIR/${name}_test"; then
            echo "✓ $name PASSED"
            passed=$((passed + 1))
        else
            echo "✗ $name FAILED"
            failed=$((failed + 1))
            failed_chips+=("$name")
        fi

    else
        echo "✗ $name FAILED TO COMPILE"
        failed=$((failed + 1))
        failed_chips+=("$name")
    fi

    echo ""

done < <(
    find "$BASIC_DIR/adders" \
        "$BASIC_DIR/gates" \
        "$BASIC_DIR/memory" \
        "$BASIC_DIR/mux" \
        -type f \
        -name "*.sv" \
        | sort
)

echo "================================"
echo "          TEST SUMMARY"
echo "================================"
echo "Total:  $total"
echo "Passed: $passed"
echo "Failed: $failed"
echo "================================"

if [ "$failed" -ne 0 ]; then
    echo "Failed tests:"
    for chip in "${failed_chips[@]}"; do
        echo "- $chip"
    done
    echo "================================"
    exit 1
fi