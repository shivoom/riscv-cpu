module Zero32_tb;
    logic [31:0] out;

    Zero32 dut (
        .out(out)
    );

initial begin
        $dumpfile("waves/Zero32.vcd");
        $dumpvars(0, Zero32_tb);

        #10;
        assert(out == 32'd0);

        $display("Zero32 gate passed");
        $finish;
    end
endmodule
