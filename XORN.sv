module XORN(input logic [7:0] A,
	 input logic [7:0] B,
	 output logic [7:0] C);
	 
	 assign C = A^B;
endmodule
