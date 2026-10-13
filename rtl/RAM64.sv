module RAM64 (
    input clk,
    input [5:0] address,
    input [31:0] in,
    input load,
    output [31:0] out
);
    logic [31:0] memory [0:63];

    always_ff @(posedge clk) begin
        if (load) begin
            memory[address] <= in;
        end
    end

    assign out = memory[address];
endmodule
