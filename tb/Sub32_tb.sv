module Sub32_tb;
    logic [31:0] a;
    logic [31:0] b;
    logic [31:0] out;

    Sub32 dut (
        .a(a),
        .b(b),
        .out(out)
    );

initial begin
        $dumpfile("waves/Sub32.vcd");
        $dumpvars(0, Sub32_tb);

        a = 32'd5; b = 32'd3; #10;
        assert(out == 32'd2);
        a = 32'd3; b = 32'd5; #10;
        assert(out == 32'hFFFFFFFE);
        a = 32'd0; b = 32'd1; #10;
        assert(out == 32'hFFFFFFFF);
        a = 32'hFFFFFFFF; b = 32'd1; #10;
        assert(out == 32'hFFFFFFFE);

        $display("Sub32 gate passed");
        $finish;
    end
endmodule
