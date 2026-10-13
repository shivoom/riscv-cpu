module Bit_tb;
    logic clk;
    logic in;
    logic load;
    logic out;

    Bit dut (
        .clk(clk),
        .in(in),
        .load(load),
        .out(out)
    );

    always #5 clk = ~clk;

initial begin
        $dumpfile("waves/Bit.vcd");
        $dumpvars(0, Bit_tb);

        clk = 0; in = 0; load = 0; #10;
        assert(out == 0);
        in = 1; load = 1; #10;
        assert(out == 1);
        in = 0; load = 0; #10;
        assert(out == 1);
        in = 0; load = 1; #10;
        assert(out == 0);

        $display("Bit gate passed");
        $finish;
    end
endmodule
