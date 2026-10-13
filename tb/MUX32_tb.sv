module MUX32_tb;
    logic [31:0] a;
    logic [31:0] b;
    logic sel;
    logic [31:0] y;

MUX32 dut (
        .a(a),
        .b(b),
        .sel(sel),
        .y(y)
    );

initial begin
        $dumpfile("waves/MUX32.vcd");
        $dumpvars(0, MUX32_tb);

        a = 32'h12345678; b = 32'h87654321; sel = 0; #10;
        assert(y == a);
        sel = 1; #10;
        assert(y == b);

        $display("MUX32 gate passed");
        $finish;
    end
endmodule
