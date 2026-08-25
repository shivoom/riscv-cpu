module Inc32_tb;
    logic [31:0] in;
    logic [31:0] out;

Inc32 dut (
        .in(in),
        .out(out)
    );

initial begin
        $dumpfile("waves/Inc32.vcd");
        $dumpvars(0, Inc32_tb);

        in = 32'd0; #10;
        assert(out == 32'd1);
        in = 32'd41; #10;
        assert(out == 32'd42);
        in = 32'hffffffff; #10;
        assert(out == 32'd0);

        $display("Inc32 gate passed");
        $finish;
    end
endmodule
