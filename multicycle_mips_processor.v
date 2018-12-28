module multicycle_mips_processor(clk, rst);
  input wire clk, rst;
  wire PCWriteCond, PCWrite, IorD, memRead, memWrite, IRWrite, memToAcc, accWrite, ALUSrcA, ALUSrcB, PCSrc;
  wire[1:0] ALUFunc;
  wire [2:0]opcode;
  wire zero;

  datapath DP(.clk(clk),
              .rst(rst),
              .PCWriteCond(PCWriteCond),
              .PCWrite(PCWrite),
              .IorD(IorD),
              .memRead(memRead),
              .memWrite(memWrite),
              .IRWrite(IRWrite),
              .memToAcc(memToAcc),
              .accWrite(accWrite),
              .ALUSrcA(ALUSrcA),
              .ALUSrcB(ALUSrcB),
              .PCSrc(PCSrc), //
              .opcode(opcode),
              .ALUFunc(ALUFunc));

  controller CU(.clk(clk),
                .rst(rst),
                .opcode(opcode), //
                .PCWriteCond(PCWriteCond),
                .PCWrite(PCWrite),
                .IorD(IorD),
                .memRead(memRead),
                .memWrite(memWrite),
                .IRWrite(IRWrite),
                .memToAcc(memToAcc),
                .accWrite(accWrite),
                .ALUSrcA(ALUSrcA),
                .ALUSrcB(ALUSrcB),
                .PCSrc(PCSrc),
                .ALUFunc(ALUFunc));
endmodule
