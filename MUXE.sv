module MUXE(input logic [7:0] m0,m1,
			  input logic s,
			  output logic [7:0] d);
			  
	assign d = s ? m1:m0;
	
endmodule
