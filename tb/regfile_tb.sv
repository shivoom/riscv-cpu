module regfile_tb;
    logic clk, we;
    logic [4:0] rs1_addr, rs2_addr, rd_addr;
    logic [31:0] rd_data, rs1_data, rs2_data;

    regfile dut (.*);

    //clock generator
    initial clk = 0;
    always #5 clk = ~clk;

    int errors = 0;

    //task to write to a register
    task automatic write_reg(input[4:0] addr, input[31:0] data);
        @(negedge clk);
        we = 1;
        rd_addr = addr;
        rd_data = data;
        @(negedge clk);
        we = 0;
    endtask

    task automatic check_read(input[4:0] a1, input[4:0] a2, input[31:0] exp1, input[31:0] exp2);
        rs1_addr = a1;
        rs2_addr = a2;
        #1;
        //check if the data is as expected
        if ((rs1_data !== exp1) || (rs2_data !== exp2)) begin
            $display("FAIL: x%0d=%h (exp %h), x%0d=%h (exp %h)",
            a1, rs1_data, exp1, a2, rs2_data, exp2);
            errors++;
        end
    endtask

    initial begin
        //initialize everything to zero 
        we = 0; rd_addr = 0; rd_data = 0; 
        rs1_addr = 0; rs2_addr = 0;

        //test 1: read x0
        check_read(0, 0, 32'd0000, 32'd0000);

        //test 2: write and read 2 registers at once
        write_reg(1, 32'hDEADBEEF);
        write_reg(2, 32'h12345678);
        check_read(1, 2, 32'hDEADBEEF, 32'h12345678);

        //test 3: write to x0, expected to be ignored
        write_reg(0, 32'hFFFFFFfF);
        check_read(0, 1, 32'd0, 32'hDEADBEEF);

        //test 4: set we = 0
        @(negedge clk);
        we = 0;
        rd_addr = 5'd1;
        rd_data = 32'hBAD0BAD0;
        @(negedge clk);
        check_read(1, 2, 32'hDEADBEEF, 32'h12345678);

        //check for errors
        if (errors == 0) $display("ALL TESTS PASSED");
        else $display("%0d TESTS FAILED", errors);

        $finish;
    end
endmodule


            


        
    

