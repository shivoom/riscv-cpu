module RAM64_tb;
    logic clk;
    logic [5:0] address;
    logic [31:0] in;
    logic load;
    logic [31:0] out;

    RAM64 dut (
        .clk(clk),
        .address(address),
        .in(in),
        .load(load),
        .out(out)
    );

    always #5 clk = ~clk;

initial begin
        $dumpfile("waves/RAM64.vcd");
        $dumpvars(0, RAM64_tb);

        clk = 0; address = 6'd0; in = 32'd0; load = 0; #10;
        assert(out == 32'd0);
        address = 6'd10; in = 32'd456; load = 1; #10;
        address = 6'd10; load = 0; #10;
        assert(out == 32'd456);

        $display("RAM64 gate passed");
        $finish;
    end
endmodule
