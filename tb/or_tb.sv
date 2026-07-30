module or_tb;
    logic a;
    logic b;
    logic y;

    OR dut (
        .a(a),
        .b(b),
        .y(y)
    );

initial begin
        $dumpfile("waves/or.vcd");
        $dumpvars(0, or_tb);

        a = 0; b = 0; #10;
        assert(y == 0);
        a = 0; b = 1; #10;
        assert(y == 1);
        a = 1; b = 0; #10;
        assert(y == 1);
        a = 1; b = 1; #10;
        assert(y == 1);

        $display("OR gate passed");
        $finish;
    end
endmodule