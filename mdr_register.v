
module mdr_register(clk, rst, mdr_in, 
					mdr_out);
	input wire clk, rst;
	input wire[15:0] mdr_in;
	output reg[15:0] mdr_out;

    always @(posedge clk) begin
        if (rst) mdr_out = 15'b0;
        else mdr_out = mdr_in;
    end

endmodule // mdr_register
