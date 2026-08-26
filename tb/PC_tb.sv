module PC_tb;
    logic clk;
    logic [31:0] in;
    logic load;
    logic inc;
    logic [31:0] out;

    PC dut (
        .clk(clk),
        .in(in),
        .load(load),
        .inc(inc),
        .out(out)
    );

    always #5 clk = ~clk;

initial begin
        $dumpfile("waves/PC.vcd");
        $dumpvars(0, PC_tb);

        clk = 0; in = 32'd0; load = 0; inc = 0; #10;
        assert(out == 32'd0);
        in = 32'd25; load = 1; inc = 0; #10;
        assert(out == 32'd25);
        load = 0; inc = 1; #10;
        assert(out == 32'd26);
        in = 32'd99; load = 0; inc = 0; #10;
        assert(out == 32'd26);

        $display("PC gate passed");
        $finish;
    end
endmodule
