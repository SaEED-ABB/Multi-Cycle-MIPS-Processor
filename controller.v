module controller (clk, rst, opcode, PCWriteCond, PCWrite, IorD, memRead, memWrite, IRWrite, memToReg, accWrite, ALUSrcA, ALUSrcB, PCSrc, ALUFunc);
  input wire clk, rst;
  input wire[2:0] opcode;
  output wire PCWriteCond, PCWrite, IorD, memRead, memWrite, IRWrite, memToReg, accWrite, ALUSrcA, ALUSrcB, PCSrc;
  output wire[1:0] ALUFunc;


endmodule
