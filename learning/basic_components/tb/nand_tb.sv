module nand_tb;
    logic a;
    logic b;
    logic y;

    NAND dut (
        .a(a),
        .b(b),
        .y(y)
    );

initial begin
        $dumpfile("waves/nand.vcd");
        $dumpvars(0, nand_tb);

        a = 0; b = 0; #10;
        assert(y == 1);
        a = 0; b = 1; #10;
        assert(y == 1);
        a = 1; b = 0; #10;
        assert(y == 1);
        a = 1; b = 1; #10;
        assert(y == 0);

        $display("NAND gate passed");
        $finish;
    end
endmodule
