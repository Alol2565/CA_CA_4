`timescale 1ns/1ns
// read data 1  | 32 bits ---------->  read data 0 : 31
//read data 2  | 32 bits ----------> read data 32 : 63
//INST[15:0] (sign extended) | 32 bits ----------> inst1 [31:0]
//inst[20 - 16] | 5 bits----------> inst2 [4:0]
//inst[15 - 11] | 5 bits----------> inst3 [4:0]
//EX Control Signal: ALUSrc | ALUOp[2:0] | RegDst[1:0] | 6 bits--------> excntrlsig[5:0]
//MEM Control Signal : MemRead | MemWrite | PCSrc[1:0] | 4 bits ------------> memcntrlsig[3:0]
//WB  Control Signal : RegWrite | MemToReg | 2 bits --------> wbcntrlsig[1:0]

module IDEXreg(input [63:0] read_data_in, input [31:0] inst1_in
                ,input [4:0] inst2_in
                ,input [4:0] inst3_in
                ,input [5:0] exccntrlsig_in
                ,input [3:0] memcntrlsig_in
                ,input [1:0] wbcntrlsig_in
                ,input [31:0] addr_in , input clk, rst
                ,output reg [63:0] read_data_out
                ,output reg [31:0] inst1_out
                ,output reg [4:0] inst2_out
                ,output reg [4:0] inst3_out
                ,output reg [5:0] excntrlsig_out
                ,output reg [3:0] memcntrlsig_out
                ,output reg [1:0] wbcntrlsig_out
                ,output reg [31:0] addr_out);
  always@(posedge clk, posedge rst) begin
    if(rst)
      {read_data_out,inst1_out,inst2_out,inst3_out,excntrlsig_out,memcntrlsig_out,wbcntrlsig_out,addr_out} = 150'b0;
    else begin
      read_data_out <= read_data_in;
      inst1_out <= inst1_in;
      inst2_out <= inst2_in;
      inst3_out <= inst3_in;
      excntrlsig_out <= exccntrlsig_in;  
      memcntrlsig_out <= memcntrlsig_in;
      wbcntrlsig_out <= wbcntrlsig_in;
      addr_out <= addr_in;
    end
  end
endmodule

