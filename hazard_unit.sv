`timescale 1ns/1ns
module hazardUnit (
  output reg IF_ID_write, pc_write, control,
  input [4:0] ID_EX_rt, Rs, Rt,
  input ID_EX_memread, jmp, dst, memwrite, beq, bne
  );
  
  always@(*)begin
    if(ID_EX_memread & (ID_EX_rt != 5'b0) & (
      ( (ID_EX_rt == Rs)
      & (~jmp) ) |
      ( (ID_EX_rt == Rt)
      & (dst|beq|bne|memwrite) )     
    )) begin
      IF_ID_write = 1'b0;
      pc_write = 1'b0;
      control = 1'b0;
    end
    else begin
      IF_ID_write = 1'b1;
      pc_write = 1'b1;
      control = 1'b1;
    end
  end
endmodule