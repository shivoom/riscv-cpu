module regfile (
    input logic clk,
    input logic we,
    input logic [4:0] rs1_addr,
    input logic [4:0] rs2_addr,
    input logic [4:0] rd_addr,
    input logic [31:0] rd_data,
    input logic [31:0] rs1_data,
    input logic [31:0] rs2_data,

);
    //32 registers, holding 32 bits of data
    logic [31:0] regs [31:0];
    

    always_ff @(posedge clk) begin
        //check if write is enabled and the write address is not x0
        if (we && rd_addr != 5'd0) 
            regs[rd_addr] <= rd_data;
        
    end

    //reading x0 always returns 0
    assign rs1_data = (rs1_addr == 5'd0) ? 32'd0 : regs[rs1_addr];
    assign rs2_data = (rs2_addr == 5'd0) ? 32'd0 : regs[rs2_addr];
endmodule
