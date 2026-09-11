module MUX4Way_tb;
    logic a;
    logic b;
    logic c;
    logic d;
    logic [1:0] sel;
    logic y;

MUX4Way dut (
        .a(a),
        .b(b),
        .c(c),
        .d(d),
        .sel(sel),
        .y(y)
    );

initial begin
        $dumpfile("waves/MUX4Way.vcd");
        $dumpvars(0, MUX4Way_tb);

        a = 1; b = 0; c = 0; d = 0; sel = 2'b00; #10;
        assert(y == 1);
        a = 0; b = 1; c = 0; d = 0; sel = 2'b01; #10;
        assert(y == 1);
        a = 0; b = 0; c = 1; d = 0; sel = 2'b10; #10;
        assert(y == 1);
        a = 0; b = 0; c = 0; d = 1; sel = 2'b11; #10;
        assert(y == 1);

        $display("MUX4Way gate passed");
        $finish;
    end
endmodule
