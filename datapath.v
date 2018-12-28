module datapath(clk, rst, PCWriteCond, PCWrite, IorD, memRead, memWrite, IRWrite, memToAcc, accWrite, ALUSrcA, ALUSrcB, PCSrc, opcode, ALUFunc);
  input wire clk, rst, PCWriteCond, PCWrite, IorD, memRead, memWrite, IRWrite, memToAcc, accWrite, ALUSrcA, ALUSrcB, PCSrc;
  input wire[1:0] ALUFunc;
  output wire[2:0] opcode;

  wire[12:0] PCIn, PCOut;
  pc_register PC(.clk(clk), .rst(rst), .pc_in(PCIn), .pc_write((zero & PCWriteCond) | PCWrite), .pc_out(PCOut));

  wire[15:0] IROut;
  wire[12:0] memoryAddress;
  mux2_13bit MUX_AT_MEMORY(.sel(IorD), .a0(PCOut), .a1(IROut), .which_a(memoryAddress));
  wire[15:0] accOut, memOut;
  memory MEMORY(.clk(clk), .rst(rst), .address(memoryAddress), .write_data(accOut), .mem_read(memRead), .mem_write(memWrite), .read_data(memOut));

  ir_register IR(.clk(clk), .rst(rst), .ir_in(memOut), .ir_write(IRWrite), .ir_out(IROut));
  wire[15:0] MDROut;
  mdr_register MDR(.clk(clk), .rst(rst), .mdr_in(memOut), .mdr_out(MDROut));

  wire[15:0] ALUOut, accIn;
  mux2_16bit MUX_AT_ACC(.sel(memToAcc), .a0(ALUOut), .a1(MDROut), .which_a(accIn));
  acc_reg ACC(.clk(clk), .rst(rst), .acc_in(accIn), .acc_out(accOut));

  wire[15:0] ALUInA, ALUInB;
  mux2_16bit MUX_AT_ALU_A(.sel(ALUSrcA), .a0(PCOut), .a1(accOut), .which_a(ALUInA));
  mux2_16bit MUX_AT_ALU_B(.sel(ALUSrcB), .a0(MDROut), .a1(16'b1), .which_a(ALUInB));
  alu ALU(.a(ALUInA), .b(ALUInB), .alu_func(ALUFunc), .zero(zero), .alu_out(ALUOut));

  mux2_16bit MUX_AT_PC(.sel(PCSrc), .a0(ALUOut), .a1(IROut), .which_a(PCIn));
endmodule
