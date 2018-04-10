module SumaPF_TB();

	//signals
	logic [31:0] a;
	logic [31:0] b;
	logic [31:0] result;
			  
	//DUT instance
	SumaPF DUT(a,b,result);
	
	//Test
	initial begin	
	a = 256;
	b = 568;
	#10;
	a = 10;
	b = 20;
	#10;
	a = -125;
	b = -22;
	#10;
	a = 589;
	b = 23;
	#10;
	a = 15;
	b = 201;
	#10;
	a = -8562;
	b = -7452;
	#10;
	a = 562;
	b = -742;
	#10;
	a = 62;
	b = 72;
	#10;
	 
	end

endmodule
