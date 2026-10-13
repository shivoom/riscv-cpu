module Bit (
    input clk,
    input in,
    input load,
    output logic out
);
    always_ff @(posedge clk) begin
        if (load) begin
            out <= in;
        end
    end
endmodule
