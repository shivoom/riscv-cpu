module Or32_tb;
    logic [31:0] a;
    logic [31:0] b;
    logic [31:0] out;

    Or32 dut (
        .a(a),
        .b(b),
        .out(out)
    );

initial begin
        $dumpfile("waves/Or32.vcd");
        $dumpvars(0, Or32_tb);

        a = 32'h00000000; b = 32'h00000000; #10;
        assert(out == 32'd0);
        a = 32'h00000000; b = 32'hFFFFFFFF; #10;
        assert(out == 32'hFFFFFFFF);
        a = 32'h12345678; b = 32'h00FF00FF; #10;
        assert(out == 32'h12FF56FF);
        a = 32'hF0F0F0F0; b = 32'h0F0F0F0F; #10;
        assert(out == 32'hFFFFFFFF);

        $display("Or32 gate passed");
        $finish;
    end
endmodule
