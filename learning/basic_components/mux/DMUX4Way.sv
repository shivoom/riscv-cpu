module DMUX4Way (
    input in,
    input [1:0] sel,
    output a,
    output b,
    output c,
    output d
);
    assign a = in & ~sel[1] & ~sel[0];
    assign b = in & ~sel[1] & sel[0];
    assign c = in & sel[1] & ~sel[0];
    assign d = in & sel[1] & sel[0];
endmodule
