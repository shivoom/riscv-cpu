module RAM4K_tb;
    logic clk;
    logic [11:0] address;
    logic [31:0] in;
    logic load;
    logic [31:0] out;

    RAM4K dut (
        .clk(clk),
        .address(address),
        .in(in),
        .load(load),
        .out(out)
    );

    always #5 clk = ~clk;

initial begin
        $dumpfile("waves/RAM4K.vcd");
        $dumpvars(0, RAM4K_tb);

        clk = 0; address = 12'd0; in = 32'd0; load = 0; #10;
        assert(out == 32'd0);
        address = 12'd123; in = 32'd321; load = 1; #10;
        address = 12'd123; load = 0; #10;
        assert(out == 32'd321);

        $display("RAM4K gate passed");
        $finish;
    end
endmodule
