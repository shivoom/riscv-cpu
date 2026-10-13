module alu_decoder (
    input logic [2:0] funct3,
    input logic funct7_b5,
    input logic is_rtype,
    output logic [3:0] alu_ctrl
);
    always_comb begin
        // ADD is the default; each supported funct3 selects an ALU operation.
        alu_ctrl = 4'b0000;

        case (funct3)
            3'b000: begin
                // For immediate instructions, inst[30] is immediate data.
                if (is_rtype && funct7_b5)
                    alu_ctrl = 4'b0001; // SUB
                else
                    alu_ctrl = 4'b0000; // ADD / ADDI
            end
            3'b001: alu_ctrl = 4'b0101; // SLL / SLLI
            3'b010: alu_ctrl = 4'b1000; // SLT / SLTI
            3'b011: alu_ctrl = 4'b1001; // SLTU / SLTIU
            3'b100: alu_ctrl = 4'b0100; // XOR / XORI
            3'b101: begin
                if (funct7_b5)
                    alu_ctrl = 4'b0111; // SRA / SRAI
                else
                    alu_ctrl = 4'b0110; // SRL / SRLI
            end
            3'b110: alu_ctrl = 4'b0011; // OR / ORI
            3'b111: alu_ctrl = 4'b0010; // AND / ANDI
            default: alu_ctrl = 4'b0000;
        endcase
    end
endmodule
