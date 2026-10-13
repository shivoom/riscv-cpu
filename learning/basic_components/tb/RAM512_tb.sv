module RAM512_tb;
    logic clk;
    logic [8:0] address;
    logic [31:0] in;
    logic load;
    logic [31:0] out;

    RAM512 dut (
        .clk(clk),
        .address(address),
        .in(in),
        .load(load),
        .out(out)
    );

    always #5 clk = ~clk;

initial begin
        $dumpfile("waves/RAM512.vcd");
        $dumpvars(0, RAM512_tb);

        clk = 0; address = 9'd0; in = 32'd0; load = 0; #10;
        assert(out == 32'd0);
        address = 9'd123; in = 32'd789; load = 1; #10;
        address = 9'd123; load = 0; #10;
        assert(out == 32'd789);

        $display("RAM512 gate passed");
        $finish;
    end
endmodule
