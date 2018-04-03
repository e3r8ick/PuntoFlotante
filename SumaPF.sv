module SumaPF(input logic [31:0] A,
				  input logic [31:0] B,
				  output logic [31:0] result);
				  
	///Separar mantisas, exponentes  signos			  
	logic sign;
	assign sign = A[31];
	
	logic [7:0] expA;
	assign expA = A[30:23];
	logic [7:0] expB;
	assign expB = B[30:23];
	
	logic [22:0] mantA;
	assign mantA = A[22:0];
	logic [22:0] mantB;
	assign mantB = B[22:0];
	
	///Variables del resultado
	logic [7:0] expRes;
	logic [22:0] mantRes;
	
endmodule
	