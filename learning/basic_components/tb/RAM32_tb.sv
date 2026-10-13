module RAM32_tb;
    logic clk;
    logic [31:0] address;
    logic [31:0] in;
    logic load;
    logic [31:0] out;

    RAM32 dut (
        .clk(clk),
        .address(address),
        .in(in),
        .load(load),
        .out(out)
    );

    always #5 clk = ~clk;

initial begin
        $dumpfile("waves/RAM32.vcd");
        $dumpvars(0, RAM32_tb);

        clk = 0; address = 32'd0; in = 32'd0; load = 0; #10;
        assert(out == 32'd0);
        address = 32'd5; in = 32'd42; load = 1; #10;
        address = 32'd5; load = 0; #10;
        assert(out == 32'd42);

        $display("RAM32 gate passed");
        $finish;
    end
endmodule
