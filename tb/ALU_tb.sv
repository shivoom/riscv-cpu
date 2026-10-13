module ALU_tb;
    logic [31:0] x;
    logic [31:0] y;
    logic zr;
    logic ng;
    logic [31:0] out;
    logic [1:0] sel;

    ALU dut (
        .x(x),
        .y(y),
        .sel(sel),
        .zr(zr),
        .ng(ng),
        .out(out)
    );

initial begin
        $dumpfile("waves/ALU.vcd");
        $dumpvars(0, ALU_tb);

        x = 32'd5; y = 32'd3; sel = 2'b00; #10;
        assert(out == 32'd5);
        x = 32'd5; y = 32'd3; sel = 2'b01; #10;
        assert(out == 32'd3);
        x = 32'd5; y = 32'd3; sel = 2'b10; #10;
        assert(out == 32'd8);
        x = 32'd5; y = 32'd3; sel = 2'b11; #10;
        assert(out == 32'd2);

        x = 32'd0; y = 32'd0; sel = 2'b00; #10;
        assert(zr == 1'b1 && ng == 1'b0 && out == 32'd0);

        x = 32'd1; y = 32'd0; sel = 2'b00; #10;
        assert(zr == 1'b0 && ng == 1'b0 && out == 32'd1);

        x = 32'h80000000; y = 32'd0; sel = 2'b00; #10;
        assert(ng == 1'b1);

        $display("ALU gate passed");
        $finish;
    end
endmodule
