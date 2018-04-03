module MUXM(input logic [23:0] m0,m1,
			  input logic s,
			  output logic [23:0] d);
			  
	assign d = s ? m1:m0;
	
endmodule
