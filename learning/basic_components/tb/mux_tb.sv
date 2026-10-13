module mux_tb;
    logic a;
    logic b;
    logic sel;
    logic y;

    MUX dut (
        .a(a),
        .b(b),
        .sel(sel),
        .y(y)
    );

initial begin
        $dumpfile("waves/mux.vcd");
        $dumpvars(0, mux_tb);

        a = 0; b = 0; sel = 0; #10;
        assert(y == 0);
        a = 0; b = 1; sel = 0; #10;
        assert(y == 0);
        a = 1; b = 0; sel = 0; #10;
        assert(y == 1);
        a = 1; b = 1; sel = 0; #10;
        assert(y == 1);

        a = 0; b = 0; sel = 1; #10;
        assert(y == 0);
        a = 0; b = 1; sel = 1; #10;
        assert(y == 1);
        a = 1; b = 0; sel = 1; #10;
        assert(y == 0);
        a = 1; b = 1; sel = 1; #10;
        assert(y == 1);

        $display("MUX gate passed");
        $finish;
    end
endmodule