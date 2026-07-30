module not_tb;
    logic a;
    logic y;

    NOT dut (
        .a(a),
        .y(y)
    );

initial begin
        $dumpfile("waves/not.vcd");
        $dumpvars(0, not_tb);

        a = 0; #10;
        assert(y == 1);
        a = 1; #10;
        assert(y == 0);

        $display("NOT gate passed");
        $finish;
    end
endmodule
