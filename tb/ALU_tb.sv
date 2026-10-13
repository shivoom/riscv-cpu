module ALU_tb;
    logic [31:0] a;
    logic [31:0] b;
    logic zr;
    logic [31:0] result;
    logic [3:0] alu_ctrl;

    ALU dut (
        .a(a),
        .b(b),
        .alu_ctrl(alu_ctrl),
        .zr(zr),
        .result(result)
    );

    initial begin
        $dumpfile("waves/ALU.vcd");
        $dumpvars(0, ALU_tb);

        // ADD tests
        a = 32'd0; b = 32'd0; alu_ctrl = 4'b0000; #10;
        assert(result == 32'd0 && zr == 1'b1)
            else $error("ADD zero: expected result=0, zr=1; got result=%0d zr=%0b", result, zr);

        a = 32'd1; b = 32'd2; alu_ctrl = 4'b0000; #10;
        assert(result == 32'd3 && zr == 1'b0)
            else $error("ADD: expected 3, got %0d", result);

        a = 32'hFFFFFFFF; b = 32'd1; alu_ctrl = 4'b0000; #10;
        assert(result == 32'd0 && zr == 1'b1)
            else $error("ADD wraparound: expected 0, got %0d", result);

        // SUB tests
        a = 32'd5; b = 32'd3; alu_ctrl = 4'b0001; #10;
        assert(result == 32'd2)
            else $error("SUB: expected 2, got %0d", result);

        a = 32'd3; b = 32'd5; alu_ctrl = 4'b0001; #10;
        assert(result == 32'hFFFFFFFE)
            else $error("SUB underflow: expected 0xFFFFFFFE, got %0h", result);

        a = 32'd0; b = 32'd1; alu_ctrl = 4'b0001; #10;
        assert(result == 32'hFFFFFFFF)
            else $error("SUB: expected 0xFFFFFFFF, got %0h", result);

        a = 32'hFFFFFFFF; b = 32'd1; alu_ctrl = 4'b0001; #10;
        assert(result == 32'hFFFFFFFE)
            else $error("SUB: expected 0xFFFFFFFE, got %0h", result);

        // XOR tests
        a = 32'd0; b = 32'd0; alu_ctrl = 4'b0100; #10;
        assert(result == 32'd0)
            else $error("XOR: expected 0, got %0d", result);

        a = 32'd0; b = 32'hFFFFFFFF; alu_ctrl = 4'b0100; #10;
        assert(result == 32'hFFFFFFFF)
            else $error("XOR: expected 0xFFFFFFFF, got %0h", result);

        a = 32'hFFFFFFFF; b = 32'hFFFFFFFF; alu_ctrl = 4'b0100; #10;
        assert(result == 32'd0 && zr == 1'b1)
            else $error("XOR self: expected zero, got %0h", result);

        // OR tests
        a = 32'h00000000; b = 32'hAAAAAAAA; alu_ctrl = 4'b0011; #10;
        assert(result == 32'hAAAAAAAA)
            else $error("OR: expected 0xAAAAAAAA, got %0h", result);

        a = 32'h0F0F0F0F; b = 32'hF0F0F0F0; alu_ctrl = 4'b0011; #10;
        assert(result == 32'hFFFFFFFF)
            else $error("OR: expected 0xFFFFFFFF, got %0h", result);

        a = 32'hFFFFFFFF; b = 32'h00000000; alu_ctrl = 4'b0011; #10;
        assert(result == 32'hFFFFFFFF)
            else $error("OR identity: expected 0xFFFFFFFF, got %0h", result);

        // Immediate-style ORI/XORI/ANDI/ADDI tests (same ALU ops using a sign-extended immediate as b)
        a = 32'h00000005; b = 32'h00000FF0; alu_ctrl = 4'b0100; #10;
        assert(result == 32'h00000FF5)
            else $error("XORI immediate: expected 0x00000FF5, got %0h", result);

        a = 32'h00000005; b = 32'h00000FF0; alu_ctrl = 4'b0011; #10;
        assert(result == 32'h00000FF5)
            else $error("ORI immediate: expected 0x00000FF5, got %0h", result);

        a = 32'h00000FF0; b = 32'h0000000F; alu_ctrl = 4'b0010; #10;
        assert(result == 32'h00000000)
            else $error("ANDI immediate: expected 0x00000000, got %0h", result);

        a = 32'h00000005; b = 32'h0000000A; alu_ctrl = 4'b0000; #10;
        assert(result == 32'h0000000F)
            else $error("ADDI immediate: expected 15, got %0d", result);

        a = 32'h00000005; b = 32'hFFFFF000; alu_ctrl = 4'b0000; #10;
        assert(result == 32'h00000005 + 32'hFFFFF000)
            else $error("ADDI sign-extended immediate: expected signed addition result, got %0d", result);

        // AND tests
        a = 32'hFFFFFFFF; b = 32'hAAAAAAAA; alu_ctrl = 4'b0010; #10;
        assert(result == 32'hAAAAAAAA)
            else $error("AND: expected 0xAAAAAAAA, got %0h", result);

        a = 32'hF0F0F0F0; b = 32'h0F0F0F0F; alu_ctrl = 4'b0010; #10;
        assert(result == 32'h00000000 && zr == 1'b1)
            else $error("AND zero: expected zero, got %0h", result);

        a = 32'h12345678; b = 32'h87654321; alu_ctrl = 4'b0010; #10;
        assert(result == 32'h02244220)
            else $error("AND: expected 0x02244220, got %0h", result);

        // SLL tests
        a = 32'd1; b = 32'd0; alu_ctrl = 4'b0101; #10;
        assert(result == 32'd1)
            else $error("SLL zero shift: expected 1, got %0d", result);

        a = 32'd1; b = 32'd5; alu_ctrl = 4'b0101; #10;
        assert(result == 32'd32)
            else $error("SLL: expected 32, got %0d", result);

        a = 32'hFFFFFFFF; b = 32'd1; alu_ctrl = 4'b0101; #10;
        assert(result == 32'hFFFFFFFE)
            else $error("SLL: expected 0xFFFFFFFE, got %0h", result);

        // SLLI immediate-style test: only low 5 bits of shift amount matter
        a = 32'd1; b = 32'd32; alu_ctrl = 4'b0101; #10;
        assert(result == 32'd1)
            else $error("SLLI: only low 5 bits matter, expected 1 for shamt 32, got %0d", result);

        // SRL tests
        a = 32'h80000000; b = 32'd1; alu_ctrl = 4'b0110; #10;
        assert(result == 32'h40000000)
            else $error("SRL: expected 0x40000000, got %0h", result);

        a = 32'd1; b = 32'd1; alu_ctrl = 4'b0110; #10;
        assert(result == 32'd0)
            else $error("SRL: expected 0, got %0d", result);

        a = 32'h00000010; b = 32'd4; alu_ctrl = 4'b0110; #10;
        assert(result == 32'd1)
            else $error("SRL: expected 1, got %0d", result);

        // SRA tests
        a = 32'h80000000; b = 32'd1; alu_ctrl = 4'b0111; #10;
        assert(result == 32'hC0000000)
            else $error("SRA: expected 0xC0000000, got %0h", result);

        a = 32'hFFFFFFFF; b = 32'd1; alu_ctrl = 4'b0111; #10;
        assert(result == 32'hFFFFFFFF)
            else $error("SRA: expected 0xFFFFFFFF, got %0h", result);

        a = 32'h00000002; b = 32'd1; alu_ctrl = 4'b0111; #10;
        assert(result == 32'd1)
            else $error("SRA: expected 1, got %0d", result);

        // I-type compare tests
        a = 32'hFFFFFFFF; b = 32'h00000000; alu_ctrl = 4'b1000; #10;
        assert(result == 32'd1)
            else $error("SLTI: expected 1 for -1 < 0, got %0d", result);

        a = 32'd1; b = 32'hFFFFFFFF; alu_ctrl = 4'b1000; #10;
        assert(result == 32'd0)
            else $error("SLTI: expected 0 for 1 < -1, got %0d", result);

        a = 32'd1; b = 32'hFFFFFFFF; alu_ctrl = 4'b1001; #10;
        assert(result == 32'd1)
            else $error("SLTIU: expected 1 for 1 < 0xFFFFFFFF, got %0d", result);

        a = 32'hFFFFFFFF; b = 32'd1; alu_ctrl = 4'b1001; #10;
        assert(result == 32'd0)
            else $error("SLTIU: expected 0 for 0xFFFFFFFF < 1, got %0d", result);

        // SLT signed tests
        a = 32'hFFFFFFFF; b = 32'd0; alu_ctrl = 4'b1000; #10;
        assert(result == 32'd1)
            else $error("SLT: expected 1 for -1 < 0, got %0d", result);

        a = 32'd1; b = 32'hFFFFFFFF; alu_ctrl = 4'b1000; #10;
        assert(result == 32'd0)
            else $error("SLT: expected 0 for 1 < -1, got %0d", result);

        a = 32'd2; b = 32'd3; alu_ctrl = 4'b1000; #10;
        assert(result == 32'd1)
            else $error("SLT: expected 1 for 2 < 3, got %0d", result);

        a = 32'd3; b = 32'd2; alu_ctrl = 4'b1000; #10;
        assert(result == 32'd0)
            else $error("SLT: expected 0 for 3 < 2, got %0d", result);

        // SLTU unsigned tests
        a = 32'd1; b = 32'hFFFFFFFF; alu_ctrl = 4'b1001; #10;
        assert(result == 32'd1)
            else $error("SLTU: expected 1 for 1 < 0xFFFFFFFF, got %0d", result);

        a = 32'hFFFFFFFF; b = 32'd1; alu_ctrl = 4'b1001; #10;
        assert(result == 32'd0)
            else $error("SLTU: expected 0, got %0d", result);

        a = 32'd5; b = 32'd5; alu_ctrl = 4'b1001; #10;
        assert(result == 32'd0)
            else $error("SLTU: expected 0 for equal values, got %0d", result);

        $display("ALU tests passed");
        $finish;
    end
endmodule
