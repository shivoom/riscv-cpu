module RegisterFile_tb;
    logic clk;
    logic [2:0] a;
    logic [2:0] b;
    logic [2:0] d;
    logic [31:0] in;
    logic load;
    logic [31:0] outA;
    logic [31:0] outB;

    RegisterFile dut (
        .clk(clk),
        .a(a),
        .b(b),
        .d(d),
        .in(in),
        .load(load),
        .outA(outA),
        .outB(outB)
    );

    always #5 clk = ~clk;

initial begin
        $dumpfile("waves/RegisterFile.vcd");
        $dumpvars(0, RegisterFile_tb);

        clk = 0; a = 3'd0; b = 3'd1; d = 3'd0; in = 32'd10; load = 0; #10;
        assert(outA == 32'd0 && outB == 32'd0);
        d = 3'd0; in = 32'd10; load = 1; #10;
        d = 3'd1; in = 32'd20; load = 1; #10;
        a = 3'd0; b = 3'd1; #10;
        assert(outA == 32'd10 && outB == 32'd20);

        $display("RegisterFile gate passed");
        $finish;
    end
endmodule
