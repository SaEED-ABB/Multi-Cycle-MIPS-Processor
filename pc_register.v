module pc_register(clk, rst, pc_in, pc_write,
					pc_out);
	input wire clk, rst , pc_write;
	input wire[12:0] pc_in;
	output reg[12:0] pc_out;

    always @(posedge clk) begin
        if (rst) pc_out = 13'b0;
	      else if(pc_write) pc_out = pc_in;
    end

endmodule // pc_register
