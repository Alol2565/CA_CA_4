`timescale 1ns/1ns

module IFIDreg(input [31:0] inst_in, input [31:0] addr_in , input clk, rst, output reg [31:0] inst_out, output reg [31:0] addr_out);
  always@(posedge clk, posedge rst) begin
    if(rst)
      {inst_out,addr_out} = 64'b0;
    else begin
      inst_out <= inst_in;
      addr_out <= addr_in;  
    end
  end
endmodule

