module dmux_tb;
    logic a;
    logic sel;
    logic y0;
    logic y1;

DMUX dut (
        .a(a),
        .sel(sel),
        .y0(y0),
        .y1(y1)
    );

initial begin
        $dumpfile("waves/dmux.vcd");
        $dumpvars(0, dmux_tb);

        a = 0; sel = 0; #10;
        assert(y0 == 0);
        assert(y1 == 0);
        a = 1; sel = 0; #10;
        assert(y0 == 1);
        assert(y1 == 0);

        a = 0; sel = 1; #10;
        assert(y0 == 0);
        assert(y1 == 0);
        a = 1; sel = 1; #10;
        assert(y0 == 0);
        assert(y1 == 1);

        $display("DMUX gate passed");
        $finish;
    end

endmodule