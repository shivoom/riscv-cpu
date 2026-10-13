module imm_gen_tb;
    logic [31:0] inst;
    logic [31:0] imm;
    logic [31:0] expected;
    integer errors = 0;
    integer i;

    imm_gen dut (
        .inst(inst),
        .imm(imm)
    );

    initial begin
        // ADDI x1, x0, -1
        inst = 32'hFFF00093;
        expected = 32'hFFFFFFFF;
        #1;
        assert (imm === expected) else begin
            errors = errors + 1;
            $error("inst=%08h expected imm=%08h got=%08h", inst, expected, imm);
        end

        // ADDI x1, x0, 5
        inst = 32'h00500093;
        expected = 32'd5;
        #1;
        assert (imm === expected) else begin
            errors = errors + 1;
            $error("inst=%08h expected imm=%08h got=%08h", inst, expected, imm);
        end

        // Minimum and maximum signed 12-bit immediate values.
        inst = {12'h800, 5'd0, 3'b000, 5'd1, 7'b0010011};
        expected = 32'hFFFFF800;
        #1;
        assert (imm === expected) else begin
            errors = errors + 1;
            $error("inst=%08h expected imm=%08h got=%08h", inst, expected, imm);
        end

        inst = {12'h7FF, 5'd0, 3'b000, 5'd1, 7'b0010011};
        expected = 32'h000007FF;
        #1;
        assert (imm === expected) else begin
            errors = errors + 1;
            $error("inst=%08h expected imm=%08h got=%08h", inst, expected, imm);
        end

        // Keep the opcode I-type while randomizing the immediate and other fields.
        for (i = 0; i < 100; i++) begin
            inst = $urandom;
            inst[6:0] = 7'b0010011;
            expected = {{20{inst[31]}}, inst[31:20]};
            #1;
            assert (imm === expected) else begin
                errors = errors + 1;
                $error("random inst=%08h expected imm=%08h got=%08h",
                       inst, expected, imm);
            end
        end

        if (errors > 0)
            $fatal(1, "imm_gen_tb failed with %0d error(s)", errors);
        else
            $finish;
    end
endmodule
