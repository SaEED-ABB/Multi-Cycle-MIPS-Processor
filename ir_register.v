module ir_register(clk, rst, ir_in, ir_write,
					ir_out);
	input wire clk, rst, ir_write;
	input wire[15:0] ir_in;
	output reg[15:0] ir_out;

    always @(posedge clk) begin
        if (rst) ir_out = 13'b0;
        else if(ir_write) ir_out = ir_in;
    end

endmodule // ir_register
