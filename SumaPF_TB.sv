module SumaPF_TB();

	//signals
	logic [31:0] a;
	logic [31:0] b;
	logic [31:0] result;
			  
	//DUT instance
	SumaPF DUT(a,b,result);
	
	//Test
	initial begin	
	a = 32'b110000101110010001000000000000000;//-100.25
	b = 32'b110000111100110001100100010110100;//-305.568
	#10;
	a = 32'b010000011101000100110011001100110;//20.3
	b = 32'b010001000100011100100000110101010;//50.263
	#10;
	a = 32'b010000101111100000000101000111101;//120.02
	b = 32'b010001000111110100001011110001101;//1000.368
	#10;
	a = 32'b110000101111100000000101000111101;//-120.02
	b = 32'b110001000100011100100000110101010;//-569.026
	#10;
	a = 32'b010000110110010001110010011000011;//200.8936
	b = 32'b010000110110010010100001010101010;//201.2604
	#10;
	a = 32'b010000101111100000000101000111101;//120.02
	b = 32'b010001000100011100100000110101010;//569.026
	#10;
	a = 32'b110001000111110100001011110001101;//-1000.368
	b = 32'b110001000100011100100000110101010;//-50.263
	#10;
	a = 32'b010000101111100000000101000111101;//120.02
	b = 32'b010001000100011100100000110101010;//569.026
	#10;
	 
	end

endmodule
