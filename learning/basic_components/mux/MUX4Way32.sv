module MUX4Way32 (
    input [31:0] a,
    input [31:0] b,
    input [31:0] c,
    input [31:0] d,
    input [1:0] sel,
    output [31:0] y
);
    assign y = sel == 2'b00 ? a :
               sel == 2'b01 ? b :
               sel == 2'b10 ? c : d;
endmodule
