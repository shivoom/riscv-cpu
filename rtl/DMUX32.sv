module DMUX32 (
    input [31:0] in,
    input sel,
    output [31:0] a,
    output [31:0] b
);
    assign a = sel ? 32'b0 : in;
    assign b = sel ? in : 32'b0;
endmodule
