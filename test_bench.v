module program1();

	reg clk, rst;
	multicycle_mips_processor mcmips(clk, rst);

	initial begin
		clk = 0;
		rst = 1;
		#10 clk = 1;
		#10 clk = 0;
		rst = 0;
		#10 clk = 1;
		#10 clk = 0;
		repeat(1000) #10 clk = !clk;
		
	end

endmodule
