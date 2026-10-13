module alu_decoder_tb;
    logic [2:0] funct3;
    logic funct7_b5;
    logic is_rtype;
    logic [3:0] alu_ctrl;
    logic [3:0] expected;
    integer errors = 0;
    integer f3;
    integer f7;
    integer rtype;

    alu_decoder dut (
        .funct3(funct3),
        .funct7_b5(funct7_b5),
        .is_rtype(is_rtype),
        .alu_ctrl(alu_ctrl)
    );

    function automatic logic [3:0] expected_ctrl(
        input logic [2:0] test_funct3,
        input logic test_funct7_b5,
        input logic test_is_rtype
    );
        case (test_funct3)
            3'b000: expected_ctrl = (test_is_rtype && test_funct7_b5)
                                    ? 4'b0001 : 4'b0000;
            3'b001: expected_ctrl = 4'b0101;
            3'b010: expected_ctrl = 4'b1000;
            3'b011: expected_ctrl = 4'b1001;
            3'b100: expected_ctrl = 4'b0100;
            3'b101: expected_ctrl = test_funct7_b5 ? 4'b0111 : 4'b0110;
            3'b110: expected_ctrl = 4'b0011;
            3'b111: expected_ctrl = 4'b0010;
            default: expected_ctrl = 4'b0000;
        endcase
    endfunction

    initial begin
        // Check every combination of funct3, funct7[5], and instruction type.
        for (f3 = 0; f3 < 8; f3++) begin
            for (f7 = 0; f7 < 2; f7++) begin
                for (rtype = 0; rtype < 2; rtype++) begin
                    funct3 = f3[2:0];
                    funct7_b5 = f7[0];
                    is_rtype = rtype[0];
                    expected = expected_ctrl(funct3, funct7_b5, is_rtype);
                    #1;
                    assert (alu_ctrl === expected) else begin
                        errors = errors + 1;
                        $error("funct3=%03b funct7_b5=%b is_rtype=%b expected=%04b got=%04b",
                               funct3, funct7_b5, is_rtype, expected, alu_ctrl);
                    end
                end
            end
        end

        // ADDI x1, x1, -1 has inst[30]=1, but must still select ADD.
        funct3 = 3'b000;
        funct7_b5 = 1'b1;
        is_rtype = 1'b0;
        expected = 4'b0000;
        #1;
        assert (alu_ctrl === expected) else begin
            errors = errors + 1;
            $error("ADDI funct3=%03b funct7_b5=%b is_rtype=%b expected=%04b got=%04b",
                   funct3, funct7_b5, is_rtype, expected, alu_ctrl);
        end

        if (errors > 0)
            $fatal(1, "alu_decoder_tb failed with %0d error(s)", errors);
        else
            $finish;
    end
endmodule
