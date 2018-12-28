
module memory(clk, rst, mem_read, mem_write, address, write_data,
					read_data);
	input wire clk, rst;
	input wire mem_read, mem_write;
	input wire[12:0] address
	input wire[15:0] write_data;
	output wire[15:0] read_data;


    	reg[15:0] memory[0:4095];

	initial begin
		{memory[1003], memory[1002], memory[1001], memory[1000]} = 32'd10;
		{memory[1007], memory[1006], memory[1005], memory[1004]} = 32'd10;
		{memory[1011], memory[1010], memory[1009], memory[1008]} = 32'd10;
		{memory[1015], memory[1014], memory[1013], memory[1012]} = 32'd10;
		{memory[1019], memory[1018], memory[1017], memory[1016]} = 32'd10;
		{memory[1023], memory[1022], memory[1021], memory[1020]} = 32'd10;
		{memory[1027], memory[1026], memory[1025], memory[1024]} = 32'd10;
		{memory[1031], memory[1030], memory[1029], memory[1028]} = 32'd10;
		{memory[1035], memory[1034], memory[1033], memory[1032]} = 32'd10;
		{memory[1039], memory[1038], memory[1037], memory[1036]} = 32'd10;

		{memory[1043], memory[1042], memory[1041], memory[1040]} = 32'd10;
		{memory[1047], memory[1046], memory[1045], memory[1044]} = 32'd10;
		{memory[1051], memory[1050], memory[1049], memory[1048]} = 32'd10;
		{memory[1055], memory[1054], memory[1053], memory[1052]} = 32'd15;
		{memory[1059], memory[1058], memory[1057], memory[1056]} = 32'd10;
		{memory[1063], memory[1062], memory[1061], memory[1060]} = 32'd10;
		{memory[1067], memory[1066], memory[1065], memory[1064]} = 32'd10;
		{memory[1071], memory[1070], memory[1069], memory[1068]} = 32'd10;
		{memory[1075], memory[1074], memory[1073], memory[1072]} = 32'd10;
		{memory[1079], memory[1078], memory[1077], memory[1076]} = 32'd10;

	end


	always @(posedge clk) begin
		if (mem_write) begin
			memory[address] = write_data;
		end
	end




	assign read_data = mem_read ? memory[address] : 32'b00000000000000000000000000000000;

endmodule // memory
