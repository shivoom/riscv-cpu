module MUX8Way32_tb;
    logic [31:0] a;
    logic [31:0] b;
    logic [31:0] c;
    logic [31:0] d;
    logic [31:0] e;
    logic [31:0] f;
    logic [31:0] g;
    logic [31:0] h;
    logic [2:0] sel;
    logic [31:0] y;

MUX8Way32 dut (
        .a(a), .b(b), .c(c), .d(d),
        .e(e), .f(f), .g(g), .h(h),
        .sel(sel), .y(y)
    );

initial begin
        $dumpfile("waves/MUX8Way32.vcd");
        $dumpvars(0, MUX8Way32_tb);

        a = 32'h11111111; b = 32'h22222222;
        c = 32'h33333333; d = 32'h44444444;
        e = 32'h55555555; f = 32'h66666666;
        g = 32'h77777777; h = 32'h88888888;
        sel = 3'b000; #10;
        assert(y == a);
        sel = 3'b001; #10;
        assert(y == b);
        sel = 3'b010; #10;
        assert(y == c);
        sel = 3'b011; #10;
        assert(y == d);
        sel = 3'b100; #10;
        assert(y == e);
        sel = 3'b101; #10;
        assert(y == f);
        sel = 3'b110; #10;
        assert(y == g);
        sel = 3'b111; #10;
        assert(y == h);

        $display("MUX8Way32 gate passed");
        $finish;
    end
endmodule
