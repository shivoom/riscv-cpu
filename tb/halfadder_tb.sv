module halfadder_tb;
    logic a;
    logic b;
    logic sum;
    logic carry;

halfadder dut (
        .a(a),
        .b(b),
        .sum(sum),
        .carry(carry)
    );

initial begin
        $dumpfile("waves/halfadder.vcd");
        $dumpvars(0, halfadder_tb);

        a = 0; b = 0; #10;
        assert(sum == 0);
        assert(carry == 0);
        a = 1; b = 0; #10;
        assert(sum == 1);
        assert(carry == 0);

        a = 0; b = 1; #10;
        assert(sum == 1);
        assert(carry == 0);
        a = 1; b = 1; #10;
        assert(sum == 0);
        assert(carry == 1);

        $display("Half Adder gate passed");
        $finish;
    end

endmodule