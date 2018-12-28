
`define FUNC_ADD 2'b00
`define FUNC_SUB 2'b01
`define FUNC_AND 2'b10
`define FUNC_NOT 2'b11

module alu(ALUFunc, a, b,
			zero, ALUResult);
	input wire[1:0] ALUFunc;
	input wire[15:0] a, b;
	output wire zero;
	output wire[15:0] ALUResult;

	assign ALUResult = (ALUFunc == `FUNC_ADD) ? a + b :
								(ALUFunc == `FUNC_SUB) ? a - b :
								(ALUFunc == `FUNC_AND) ? a & b :
								(ALUFunc == `FUNC_NOT) ? ~a :
								16'bx;

	assign zero = (ALUResult == 16'b0) ? 1'b1 : 1'b0;

endmodule // alu
