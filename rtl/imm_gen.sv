module imm_gen (
    input logic [31:0] inst,
    output logic [31:0] imm
);
    always_comb begin
        // Use zero for instructions whose immediate format is not supported yet.
        imm = 32'b0;

        case (inst[6:0])
            7'b0010011: imm = {{20{inst[31]}}, inst[31:20]};
            // Add S-type, B-type, U-type, and J-type cases here as needed.
            default: imm = 32'b0;
        endcase
    end
endmodule