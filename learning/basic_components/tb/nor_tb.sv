module nor_tb;
    logic a;
    logic b;
    logic y;

    NOR dut (
        .a(a),
        .b(b),
        .y(y)
    );

initial begin
        $dumpfile("waves/nor.vcd");
        $dumpvars(0, nor_tb);

        a = 0; b = 0; #10;
        assert(y == 1);
        a = 0; b = 1; #10;
        assert(y == 0);
        a = 1; b = 0; #10;
        assert(y == 0);
        a = 1; b = 1; #10;
        assert(y == 0);

        $display("NOR gate passed");
        $finish;
    end
endmodule
