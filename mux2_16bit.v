
module mux2_16bit(sel, a0, a1, 
					which_a);
	input wire sel;
	input wire[15:0] a0, a1;
	output wire[15:0] which_a;

	assign which_a = sel ? a1 : a0;

endmodule // mux2_16bit