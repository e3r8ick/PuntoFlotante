module MUXE(input logic [7:0] e0,e1,
			  input logic s,
			  output logic [7:0] d);
			  
	assign d = s ? e1:e0;
	
endmodule
