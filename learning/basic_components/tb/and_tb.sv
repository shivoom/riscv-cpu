module and_tb;
    logic a;
    logic b;
    logic y;

    AND dut (
        .a(a),
        .b(b),
        .y(y)
    );

initial begin
        $dumpfile("waves/and.vcd");
        $dumpvars(0, and_tb);

        a = 0; b = 0; #10;
        assert(y == 0);
        a = 0; b = 1; #10;
        assert(y == 0);
        a = 1; b = 0; #10;
        assert(y == 0);
        a = 1; b = 1; #10;
        assert(y == 1);

        $display("AND gate passed");
        $finish;
    end
endmodule

