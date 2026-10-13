module RAM8_tb;
    logic clk;
    logic [2:0] address;
    logic [31:0] in;
    logic load;
    logic [31:0] out;

    RAM8 dut (
        .clk(clk),
        .address(address),
        .in(in),
        .load(load),
        .out(out)
    );

    always #5 clk = ~clk;

initial begin
        $dumpfile("waves/RAM8.vcd");
        $dumpvars(0, RAM8_tb);

        clk = 0; address = 3'd0; in = 32'd0; load = 0; #10;
        assert(out == 32'd0);
        address = 3'd2; in = 32'd123; load = 1; #10;
        address = 3'd2; load = 0; #10;
        assert(out == 32'd123);

        $display("RAM8 gate passed");
        $finish;
    end
endmodule
