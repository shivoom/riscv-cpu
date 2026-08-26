module Not32_tb;
    logic [31:0] in;
    logic [31:0] out;

    Not32 dut (
        .in(in),
        .out(out)
    );

initial begin
        $dumpfile("waves/Not32.vcd");
        $dumpvars(0, Not32_tb);

        in = 32'h00000000; #10;
        assert(out == 32'hFFFFFFFF);
        in = 32'hFFFFFFFF; #10;
        assert(out == 32'd0);
        in = 32'h12345678; #10;
        assert(out == 32'hEDCBA987);

        $display("Not32 gate passed");
        $finish;
    end
endmodule
