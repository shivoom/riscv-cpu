module RegisterFile (
    input clk,
    input [2:0] a,
    input [2:0] b,
    input [2:0] d,
    input [31:0] in,
    input load,
    output [31:0] outA,
    output [31:0] outB
);
    logic [31:0] regs [0:7];

    always_ff @(posedge clk) begin
        if (load) begin
            regs[d] <= in;
        end
    end

    assign outA = regs[a];
    assign outB = regs[b];
endmodule
