module acc_register(clk, rst, acc_in, acc_write,
					ir_out);
	input wire clk, rst, ir_write;
	input wire[15:0] acc_in;
	output reg[15:0] acc_out;

    always @(posedge clk) begin
        if (rst) acc_out = 13'b0;
        else if(acc_write) acc_out = acc_in;
    end

endmodule // acc_register
