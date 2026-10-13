module RAM16K_tb;
    logic clk;
    logic [13:0] address;
    logic [31:0] in;
    logic load;
    logic [31:0] out;

    RAM16K dut (
        .clk(clk),
        .address(address),
        .in(in),
        .load(load),
        .out(out)
    );

    always #5 clk = ~clk;

initial begin
        $dumpfile("waves/RAM16K.vcd");
        $dumpvars(0, RAM16K_tb);

        clk = 0; address = 14'd0; in = 32'd0; load = 0; #10;
        assert(out == 32'd0);
        address = 14'd2222; in = 32'd777; load = 1; #10;
        address = 14'd2222; load = 0; #10;
        assert(out == 32'd777);

        $display("RAM16K gate passed");
        $finish;
    end
endmodule
