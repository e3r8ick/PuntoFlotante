module srlN(input logic [23:0] mantisa,
		 input logic [7:0] corrimiento,
		 output logic [23:0] y);
	
	assign y = mantisa >> corrimiento;
	
endmodule
