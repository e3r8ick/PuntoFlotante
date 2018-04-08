module srlN(input logic [22:0] mantisa,
		 input logic [7:0] corrimiento,
		 output logic [22:0] y);
	
	assign y = mantisa >> corrimiento;
	
endmodule
