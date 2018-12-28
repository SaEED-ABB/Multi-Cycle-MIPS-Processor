module multicycle_mips_processor(clk, rst);
  input wire clk, rst;
  wire PCWriteCond, PCWrite, IorD, memRead, memWrite, IRWrite, memToReg, accWrite, ALUSrcA, ALUSrcB, PCSrc, ALUFunc;
  wire opcode, zero;

  datapath DP(.clk(clk),
              .rst(rst),
              .PCWriteCond(PCWriteCond),
              .PCWrite(PCWrite),
              .IorD(IorD),
              .memRead(memRead),
              .memWrite(memWrite),
              .IRWrite(IRWrite),
              .memToReg(memToReg),
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
                .memToReg(memToReg),
                .accWrite(accWrite),
                .ALUSrcA(ALUSrcA),
                .ALUSrcB(ALUSrcB),
                .PCSrc(PCSrc),
                .ALUFunc(ALUFunc));
endmodule
