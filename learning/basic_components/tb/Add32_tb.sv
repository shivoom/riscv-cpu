module Add32_tb;
    logic [31:0] a;
    logic [31:0] b;
    logic [31:0] sum;

Add32 dut (
        .a(a),
        .b(b),
        .sum(sum)
    );

initial begin
        $dumpfile("waves/Add32.vcd");
        $dumpvars(0, Add32_tb);

        a = 32'd0; b = 32'd0; #10;
        assert(sum == 32'd0);
        a = 32'd1; b = 32'd2; #10;
        assert(sum == 32'd3);
        a = 32'hffffffff; b = 32'd1; #10;
        assert(sum == 32'd0);

        $display("Add32 gate passed");
        $finish;
    end
endmodule
