module MUXM(input logic [22:0] m0,m1,
			  input logic s,
			  output logic [22:0] d);
			  
	assign d = s ? m1:m0;
	
endmodule
