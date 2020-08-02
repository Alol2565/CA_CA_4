`timescale 1ns/1ns
// read data  | 32 bits ---------->  read data 0 : 31
// Address -------------> addresss 0 : 31 
//inst[20 - 16] | 5 bits----------> inst2 [4:0]
//WB  Control Signal : RegWrite | MemToReg | 2 bits --------> wbcntrlsig[1:0]

module MEMWBreg(input [31:0] read_data_in
                ,input [4:0] inst2_in
                ,input [1:0] wbcntrlsig_in
                ,input [31:0] addresss_in , input clk, rst
                ,output reg [31:0] read_data_out
                ,output reg [4:0] inst2_out
                ,output reg [1:0] wbcntrlsig_out
                ,output reg [31:0] addresss_out);
  always@(posedge clk, posedge rst) begin
    if(rst)
      {read_data_out, inst2_out, wbcntrlsig_out, addresss_out} = 71'b0;
    else begin
      read_data_out <= read_data_in;
      inst2_out <= inst2_in;
      wbcntrlsig_out <= wbcntrlsig_in;
      addresss_out <= addresss_in;
    end
  end
endmodule

