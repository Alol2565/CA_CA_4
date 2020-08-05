`timescale 1ns/1ns
module dataPath(input [5:0] inbus, 
                      input ldX, shX, clrX,
                      ldY,
                      ldA, shA, clrA,
                      lde, clre,
                      add, sub,
                      clk, rst,
                      input [1:0] upload_selector,
          output [5:0] out, output[1:0] decision_bits);
  wire [5:0] ALUout,yout,aout ,xout;
  wire eout, aluco;
  b6reg Y(inbus, ldY , clk, rst, yout);
  b6shiftreg A(ALUout , shA, clrA, ldA, clk, rst, aout);
  b6shiftregci X(inbus, aout[0], clrX ,shX, ldX, clk, rst, xout);
  b1reg E(xout[0], clre, lde, clk, rst, eout );
  addSub ALU(aout, yout, add, sub, ALUout, aluco);
  
  assign out = (upload_selector == 2'b01) ?  xout : (upload_selector == 2'b10) ? aout : out;
  assign decision_bits = {aout[0],eout}; 
endmodule
                                          

`timescale 1ns/1ns
module dataPath(input [5:0] inbus, 
                      input ldX, shX, clrX,
                      ldY,
                      ldA, shA, clrA,
                      lde, clre,
                      add, sub,
                      clk, rst,
                      input [1:0] upload_selector,
          output [5:0] out, output[1:0] decision_bits);
  wire [5:0] yout, aout, xout, ALUout;
  wire eout, aluco;
  b6reg Y(inbus, ldY , clk, rst, yout);
  b6shiftreg A(ALUout , shA, clrA, ldA, clk, rst, aout);
  b6shiftregci X(inbus, aout[0], clrX ,shX, ldX, clk, rst, xout);
  b1reg E(xout[0], clre, lde, clk, rst, eout );
  addSub ALU(aout, yout, add, sub, ALUout, aluco);
  
  assign out = (upload_selector == 2'b01) ?  xout : (upload_selector == 2'b10) ? aout : out;
  assign decision_bits = {xout[0],eout}; 
endmodule
             
