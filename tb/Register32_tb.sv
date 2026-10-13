module Register32_tb;
    logic clk;
    logic [31:0] in;
    logic load;
    logic [31:0] out;

    Register32 dut (
        .clk(clk),
        .in(in),
        .load(load),
        .out(out)
    );

    always #5 clk = ~clk;

initial begin
        $dumpfile("waves/Register32.vcd");
        $dumpvars(0, Register32_tb);

        clk = 0; in = 32'd0; load = 0; #10;
        assert(out == 32'd0);
        in = 32'd123456789; load = 1; #10;
        assert(out == 32'd123456789);
        in = 32'd987654321; load = 0; #10;
        assert(out == 32'd123456789);
        in = 32'd111111111; load = 1; #10;
        assert(out == 32'd111111111);

        $display("Register32 gate passed");
        $finish;
    end
endmodule
