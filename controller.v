
// Opcodes
`define OPCODE_ADD	3'b000
`define OPCODE_SUB	3'b001
`define OPCODE_AND	3'b010
`define OPCODE_NOT	3'b011

`define OPCODE_LDA	3'b100
`define OPCODE_STA	3'b101

`define OPCODE_JMP	3'b110
`define OPCODE_JZ	3'b111

// Functions
`define FUNC_ADD	2'b00
`define FUNC_SUB	2'b01
`define FUNC_AND	2'b10
`define FUNC_NOT	2'b11


module controller (clk, rst, opcode, PCWriteCond, PCWrite, IorD, memRead, memWrite, IRWrite, memToAcc, accWrite, ALUSrcA, ALUSrcB, PCSrc, ALUFunc);
  input wire clk, rst;
  input wire[2:0] opcode;
  output reg PCWriteCond, PCWrite, IorD, memRead, memWrite, IRWrite, memToAcc, accWrite, ALUSrcA, ALUSrcB, PCSrc;
  output reg[1:0] ALUFunc;

  reg[2:0] ns;
  reg[2:0] ps;
  parameter[2:0] IF = 0, ID = 1, R_TYPE = 2, LDA = 3, STA = 4, JMP = 5, JZ = 6;

  always @(ps, opcode) begin
    ns = IF;
    case (ps)
      IF: ns = ID;
      ID: begin 
        ns = (opcode == `OPCODE_ADD || opcode == `OPCODE_SUB || opcode == `OPCODE_AND || opcode == `OPCODE_NOT) ? R_TYPE :
          (opcode == `OPCODE_LDA) ? LDA : (opcode == `OPCODE_STA) ? STA : (opcode == `OPCODE_JMP) ? JMP : JZ;
      end
      R_TYPE: ns = IF;
      LDA: ns = IF;
      STA: ns = IF;
      JMP: ns = IF;
      JZ: ns = IF;
    endcase
  end

  always @(ps) begin
    {PCWriteCond, PCWrite, memWrite, IRWrite, accWrite} = 5'b00000;
    {memRead, memToAcc, ALUSrcA, ALUSrcB, PCSrc, ALUFunc} = 7'bxxxxxxx;
    case (ps)
      IF: begin
        IorD = 1'b0;
        memRead = 1'b1;
        IRWrite = 1'b1;
        ALUSrcA = 1'b0;
        ALUSrcB = 1'b1;
        PCSrc = 1'b0;
        PCWrite = 1'b1;
        ALUFunc = 2'b00;
      end
      ID: begin
        IorD = 1'b1;
        memRead = 1'b1;
      end
      R_TYPE: begin
        ALUSrcA = 1'b1;
        ALUSrcB = 1'b0;
        accWrite = 1'b1;
        memToAcc = 1'b0;
        ALUFunc = (opcode == `OPCODE_ADD) ? 2'b00 : (opcode == `OPCODE_SUB) ? 2'b01 : (opcode == `OPCODE_AND) ? 2'b10 : 2'b11;
      end
      LDA: begin
        accWrite = 1'b1;
        memToAcc = 1'b1;
      end
      STA: begin
        IorD = 1'b1;
        memWrite = 1'b1;
      end
      JMP: begin
        PCSrc = 1'b1;
        PCWrite = 1'b1;
      end
      JZ: begin
        PCSrc = 1'b1;
        PCWriteCond = 1'b1;
        ALUSrcA = 1'b1;
      end
    endcase
  end

  always @(posedge clk) begin
    ps = ns;
  end

endmodule
