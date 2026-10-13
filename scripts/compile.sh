#!/bin/bash

set -e

PROJECT_ROOT="$(cd "$(dirname "$0")/.." && pwd)"
RTL_DIR="$PROJECT_ROOT/rtl"
TB_DIR="$PROJECT_ROOT/tb"

echo "================================"
echo "       RISC-V CHIP TESTS"
echo "================================"
echo ""

passed=0
failed=0
total=0
failed_chips=()

for chip in "$RTL_DIR"/*.sv; do

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
        continue
    fi

    # Compile and run with Verilator
    if verilator --binary \
        --assert \
        "$chip" \
        "$tb" \
        --top-module "${name}_tb" \
        -o "${name}_test"; then

        echo "Running $name..."

        if "$PROJECT_ROOT/obj_dir/${name}_test"; then
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
done

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
fi

if [ "$failed" -ne 0 ]; then
    exit 1
fi