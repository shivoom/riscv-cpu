module DMUX32_tb;
    logic [31:0] in;
    logic sel;
    logic [31:0] a;
    logic [31:0] b;

DMUX32 dut (
        .in(in),
        .sel(sel),
        .a(a),
        .b(b)
    );

initial begin
        $dumpfile("waves/DMUX32.vcd");
        $dumpvars(0, DMUX32_tb);

        in = 32'h12345678; sel = 0; #10;
        assert(a == in && b == 32'b0);
        sel = 1; #10;
        assert(a == 32'b0 && b == in);

        $display("DMUX32 gate passed");
        $finish;
    end
endmodule
