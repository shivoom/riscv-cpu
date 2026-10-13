module DMUX8Way_tb;
    logic in;
    logic [2:0] sel;
    logic a;
    logic b;
    logic c;
    logic d;
    logic e;
    logic f;
    logic g;
    logic h;

DMUX8Way dut (
        .in(in), .sel(sel),
        .a(a), .b(b), .c(c), .d(d),
        .e(e), .f(f), .g(g), .h(h)
    );

initial begin
        $dumpfile("waves/DMUX8Way.vcd");
        $dumpvars(0, DMUX8Way_tb);

        in = 0; sel = 3'b000; #10;
        assert({h, g, f, e, d, c, b, a} == 8'b0);
        in = 1; sel = 3'b000; #10;
        assert({h, g, f, e, d, c, b, a} == 8'b00000001);
        sel = 3'b001; #10;
        assert({h, g, f, e, d, c, b, a} == 8'b00000010);
        sel = 3'b010; #10;
        assert({h, g, f, e, d, c, b, a} == 8'b00000100);
        sel = 3'b011; #10;
        assert({h, g, f, e, d, c, b, a} == 8'b00001000);
        sel = 3'b100; #10;
        assert({h, g, f, e, d, c, b, a} == 8'b00010000);
        sel = 3'b101; #10;
        assert({h, g, f, e, d, c, b, a} == 8'b00100000);
        sel = 3'b110; #10;
        assert({h, g, f, e, d, c, b, a} == 8'b01000000);
        sel = 3'b111; #10;
        assert({h, g, f, e, d, c, b, a} == 8'b10000000);

        $display("DMUX8Way gate passed");
        $finish;
    end
endmodule
