module RAM16K (
    input clk,
    input [13:0] address,
    input [31:0] in,
    input load,
    output [31:0] out
);
    logic [31:0] memory [0:16383];

    always_ff @(posedge clk) begin
        if (load) begin
            memory[address] <= in;
        end
    end

    assign out = memory[address];
endmodule
