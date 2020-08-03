`timescale 1ns/1ns
module forwardingUnit (output reg [1:0] forward_A, forward_B,
            input EX_MEM_regwrite
            , MEM_WB_RegWrite
            ,input [4:0] EX_MEM_Rd
            , ID_EX_Rs
            , ID_EX_Rt  
            , MEM_WB_Rd );
  
  always@(ID_EX_Rs, EX_MEM_Rd, MEM_WB_Rd, EX_MEM_regwrite, MEM_WB_RegWrite)   
  begin
    if(EX_MEM_regwrite & (EX_MEM_Rd == ID_EX_Rs) & (EX_MEM_Rd != 5'b0)) forward_A = 2'b10;
    else if(MEM_WB_RegWrite & (MEM_WB_Rd==ID_EX_Rs) & (MEM_WB_Rd != 5'b0)) forward_A = 2'b01;
    else forward_A = 2'b0;
  end

  always@(ID_EX_Rt, EX_MEM_Rd, MEM_WB_Rd, EX_MEM_regwrite, MEM_WB_RegWrite)begin
    if(EX_MEM_regwrite & (EX_MEM_Rd == ID_EX_Rt) & (EX_MEM_Rd!=5'd0)) forward_B = 2'b10;
    else if(MEM_WB_RegWrite & (MEM_WB_Rd== ID_EX_Rt) & (MEM_WB_Rd!=5'd0)) forward_B = 2'b01;
    else forward_B = 2'b0;
  end
  
endmodule