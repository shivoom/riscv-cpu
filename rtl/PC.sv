module PC (
    input clk,
    input [31:0] in,
    input load,
    input inc,
    output [31:0] out
);
    logic [31:0] counter;

    always_ff @(posedge clk) begin
        if (load) begin
            counter <= in;
        end else if (inc) begin
            counter <= counter + 32'd1;
        end
    end

    assign out = counter;
endmodule
