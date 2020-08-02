`timescale 1ns/1ns
// read data 2  | 32 bits ---------->  read data 0 : 31
// result | 32 bits --------------> result 0 : 31
// zero | 1 bit -----------------> zero 
// Add Result -------------> addresult 0 : 31 
//inst[20 - 16] | 5 bits----------> inst2 [4:0]
//MEM Control Signal : MemRead | MemWrite | PCSrc[1:0] | 4 bits ------------> memcntrlsig[3:0]
//WB  Control Signal : RegWrite | MemToReg | 2 bits --------> wbcntrlsig[1:0]

module EXMEMreg(input [31:0] read_data_in
                ,input [4:0] inst2_in
                ,input [31:0] result_in
                ,input [3:0] memcntrlsig_in
                ,input [1:0] wbcntrlsig_in
                ,input [31:0] addresult_in , input clk, rst, zero_in
                ,output reg [31:0] read_data_out
                ,output reg [31:0] result_out
                ,output reg [4:0] inst2_out
                ,output reg [3:0] memcntrlsig_out
                ,output reg [1:0] wbcntrlsig_out
                ,output reg [31:0] addresult_out
                ,output reg zero_out);
  always@(posedge clk, posedge rst) begin
    if(rst)
      {read_data_out,result_out,inst2_out,memcntrlsig_out,wbcntrlsig_out,addresult_out, zero_out} = 108'b0;
    else begin
      read_data_out <= read_data_in;
      result_out <= result_in;
      inst2_out <= inst2_in;
      memcntrlsig_out <= memcntrlsig_in;
      wbcntrlsig_out <= wbcntrlsig_in;
      addresult_out <= addresult_in;
      zero_out <= zero_in;
    end
  end
endmodule

