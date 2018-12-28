
module memory(clk, rst, mem_read, mem_write, address, write_data,
					read_data);
	input wire clk, rst;
	input wire mem_read, mem_write;
	input wire[12:0] address;
	input wire[15:0] write_data;
	output wire[15:0] read_data;


    	reg[15:0] memory[0:4095];

	initial begin
		memory[500] = 16'd2;
		memory[501] = 16'd2;
		memory[502] = 16'd2;
		memory[503] = 16'd2;
		memory[504] = 16'd2;
		memory[505] = 16'd2;
		memory[506] = 16'd3;
		memory[507] = 16'd2;
		memory[508] = 16'd2;
		memory[509] = 16'd2;

		memory[0] = {3'b100, 13'd500};
		memory[1] = {3'b000, 13'd501};
		memory[2] = {3'b000, 13'd502};
		memory[3] = {3'b000, 13'd503};
		memory[4] = {3'b000, 13'd504};
		memory[5] = {3'b000, 13'd505};
		memory[6] = {3'b000, 13'd506};
		memory[7] = {3'b000, 13'd507};
		memory[8] = {3'b000, 13'd508};
		memory[9] = {3'b000, 13'd509};
		memory[10] = {3'b101, 13'd800};
	end


	always @(posedge clk) begin
		if (mem_write) begin
			memory[address] = write_data;
		end
	end




	assign read_data = mem_read ? memory[address] : 32'b00000000000000000000000000000000;

endmodule // memory
