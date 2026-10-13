module Register32 (
    input clk,
    input [31:0] in,
    input load,
    output logic [31:0] out
);
    always_ff @(posedge clk) begin
        if (load) begin
            out <= in;
        end
    end
endmodule
