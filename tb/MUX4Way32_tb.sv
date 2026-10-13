module MUX4Way32_tb;
    logic [31:0] a;
    logic [31:0] b;
    logic [31:0] c;
    logic [31:0] d;
    logic [1:0] sel;
    logic [31:0] y;

MUX4Way32 dut (
        .a(a), .b(b), .c(c), .d(d),
        .sel(sel), .y(y)
    );

initial begin
        $dumpfile("waves/MUX4Way32.vcd");
        $dumpvars(0, MUX4Way32_tb);

        a = 32'h11111111; b = 32'h22222222;
        c = 32'h33333333; d = 32'h44444444;
        sel = 2'b00; #10;
        assert(y == a);
        sel = 2'b01; #10;
        assert(y == b);
        sel = 2'b10; #10;
        assert(y == c);
        sel = 2'b11; #10;
        assert(y == d);

        $display("MUX4Way32 gate passed");
        $finish;
    end
endmodule
