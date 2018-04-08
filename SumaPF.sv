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
	
	//variables para mux1
	logic [22:0] m10,m11;
	logic [22:0] resultMux1;
	
	
	//variables para mux2
	logic [22:0] m20,m21;
	logic [22:0] resultMux2;
	
	///Variables del resultado
	logic [7:0] expRes;
	logic [22:0] mantRes;
	logic signRes;
	
	//comprar exponentes
	restadorNbits 
	#(8)
	restaN(expA,expB,expRes);
	
	//variables de control
	logic control1;
	logic control2;
	assign control1 = expRes[7];
	assign control2 = expRes[7];
	
	//MUX mantisas 1
	MUX
	muxOut(m10, m11, control1, resultMux1);
		
	//MUX mantisas 2
	MUX
	muxOut(m20, m21, control2, resultMux2);
	
	
endmodule
	