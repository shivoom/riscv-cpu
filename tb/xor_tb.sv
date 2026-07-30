module xor_tb;
    logic a;
    logic b;
    logic y;

    XOR dut (
        .a(a),
        .b(b),
        .y(y)
    );

initial begin
        $dumpfile("waves/xor.vcd");
        $dumpvars(0, xor_tb);

        a = 0; b = 0; #10;
        assert(y == 0);
        a = 0; b = 1; #10;
        assert(y == 1);
        a = 1; b = 0; #10;
        assert(y == 1);
        a = 1; b = 1; #10;
        assert(y == 0);

        $display("XOR gate passed");
        $finish;
    end
endmodule