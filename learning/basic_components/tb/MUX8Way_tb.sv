module MUX8Way_tb;
    logic a;
    logic b;
    logic c;
    logic d;
    logic e;
    logic f;
    logic g;
    logic h;
    logic [2:0] sel;
    logic y;

MUX8Way dut (
        .a(a), .b(b), .c(c), .d(d),
        .e(e), .f(f), .g(g), .h(h),
        .sel(sel), .y(y)
    );

initial begin
        $dumpfile("waves/MUX8Way.vcd");
        $dumpvars(0, MUX8Way_tb);

        a = 1; b = 0; c = 0; d = 0; e = 0; f = 0; g = 0; h = 0; sel = 3'b000; #10;
        assert(y == 1);
        a = 0; b = 1; sel = 3'b001; #10;
        assert(y == 1);
        b = 0; c = 1; sel = 3'b010; #10;
        assert(y == 1);
        c = 0; d = 1; sel = 3'b011; #10;
        assert(y == 1);
        d = 0; e = 1; sel = 3'b100; #10;
        assert(y == 1);
        e = 0; f = 1; sel = 3'b101; #10;
        assert(y == 1);
        f = 0; g = 1; sel = 3'b110; #10;
        assert(y == 1);
        g = 0; h = 1; sel = 3'b111; #10;
        assert(y == 1);

        $display("MUX8Way gate passed");
        $finish;
    end
endmodule
