module MUX8Way32 (
    input [31:0] a,
    input [31:0] b,
    input [31:0] c,
    input [31:0] d,
    input [31:0] e,
    input [31:0] f,
    input [31:0] g,
    input [31:0] h,
    input [2:0] sel,
    output [31:0] y
);
    assign y = sel == 3'b000 ? a :
               sel == 3'b001 ? b :
               sel == 3'b010 ? c :
               sel == 3'b011 ? d :
               sel == 3'b100 ? e :
               sel == 3'b101 ? f :
               sel == 3'b110 ? g : h;
endmodule
