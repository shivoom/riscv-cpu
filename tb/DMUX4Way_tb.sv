module DMUX4Way_tb;
    logic in;
    logic [1:0] sel;
    logic a;
    logic b;
    logic c;
    logic d;

DMUX4Way dut (
        .in(in),
        .sel(sel),
        .a(a),
        .b(b),
        .c(c),
        .d(d)
    );

initial begin
        $dumpfile("waves/DMUX4Way.vcd");
        $dumpvars(0, DMUX4Way_tb);

        in = 0; sel = 2'b00; #10;
        assert(a == 0 && b == 0 && c == 0 && d == 0);
        in = 1; sel = 2'b00; #10;
        assert(a == 1 && b == 0 && c == 0 && d == 0);
        sel = 2'b01; #10;
        assert(a == 0 && b == 1 && c == 0 && d == 0);
        sel = 2'b10; #10;
        assert(a == 0 && b == 0 && c == 1 && d == 0);
        sel = 2'b11; #10;
        assert(a == 0 && b == 0 && c == 0 && d == 1);

        $display("DMUX4Way gate passed");
        $finish;
    end
endmodule
