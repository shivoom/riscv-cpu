module fulladder_tb;
    logic a;
    logic b;
    logic cin;
    logic sum;
    logic cout;

fulladder dut (
        .a(a),
        .b(b),
        .cin(cin),
        .sum(sum),
        .cout(cout)
    );

initial begin
        $dumpfile("waves/fulladder.vcd");
        $dumpvars(0, fulladder_tb);

        a = 0; b = 0; cin = 0; #10;
        assert(sum == 0);
        assert(cout == 0);
        a = 1; b = 0; cin = 0; #10;
        assert(sum == 1);
        assert(cout == 0);

        a = 0; b = 1; cin = 0; #10;
        assert(sum == 1);
        assert(cout == 0);
        a = 1; b = 1; cin = 0; #10;
        assert(sum == 0);
        assert(cout == 1);

        a = 0; b = 0; cin = 1; #10;
        assert(sum == 1);
        assert(cout == 0);
        a = 1; b = 0; cin = 1; #10;
        assert(sum == 0);
        assert(cout == 1);

        a = 0; b = 1; cin = 1; #10;
        assert(sum == 0);
        assert(cout == 1);
        a = 1; b = 1; cin = 1; #10;
        assert(sum == 1);
        assert(cout == 1);
        $display("Full Adder gate passed");
        $finish;
    end

endmodule