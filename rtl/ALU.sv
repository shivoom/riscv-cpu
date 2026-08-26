module ALU (
    input [31:0] x,
    input [31:0] y,
    input [1:0] sel,
    output zr,
    output ng,
    output [31:0] out
);
    logic [31:0] out_reg;

    always_comb begin
        case (sel)
            2'b00: out_reg = x;
            2'b01: out_reg = y;
            2'b10: out_reg = x + y;
            2'b11: out_reg = x - y;
            default: out_reg = 32'b0;
        endcase
    end

    assign out = out_reg;
    assign zr = (out_reg == 32'b0);
    assign ng = out_reg[31];
endmodule
