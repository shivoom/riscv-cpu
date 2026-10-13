module Neg32_tb;
    logic [31:0] in;
    logic [31:0] out;

    Neg32 dut (
        .in(in),
        .out(out)
    );

initial begin
        $dumpfile("waves/Neg32.vcd");
        $dumpvars(0, Neg32_tb);

        in = 32'd0; #10;
        assert(out == 32'd0);
        in = 32'd1; #10;
        assert(out == 32'hFFFFFFFF);
        in = 32'd5; #10;
        assert(out == 32'hFFFFFFFB);
        in = 32'h80000000; #10;
        assert(out == 32'h80000000);

        $display("Neg32 gate passed");
        $finish;
    end
endmodule
