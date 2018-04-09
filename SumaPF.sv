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
	logic [22:0] resultMux1;
	
	//variables para mux2
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
	MUXM
	muxM1(mantA, mantB, control1, resultMux1);
		
	//MUX mantisas 2
	MUXM_Neg
	muxM2(mantA, mantB, control2, resultMux2);
	
	//resultado para el complemento
	logic[7: 0] expComp;
	
	//complemento
	complement
	complement(expRes,expComp);
	
	//shift
	srlN
	srlN(resultMux2,expComp);
	
	//variables para la suma
	logic carryin;
	assign carryin = 0;
	logic carryout;
	logic [22:0] sumaRes;
	 
	//suma de mantisas
	sumadorNbits 
	#(8)
	sumaN(resultMux1,resultMux2,carryin,carryout,sumaRes);
	 
	//and del bit de signo
	logic bitSigno;
	assign bitSigno = sumaRes[22];
	logic andRes;
	AND
	AND(bitSigno,1,andRes);
	
	//shift
	srlN
	alineamiento(sumaRes,andRes);
	
	//variables para muxE
	logic [7:0] mE0,mE1;
	logic [7:0] resultMuxE;
	logic controlE;
	assign controlE = expRes[7];
	
	//mux exponentes
	MUXE
	muxE(mE0, mE1, control2, resultMux2);
	
	//variables para la suma
	logic carryin2;
	assign carryin2 = andRes;
	logic carryout2;
	logic [22:0] sumaResF;
	
	//suma para alinearr
	sumadorNbits 
	#(8)
	sumaA(resultMuxE,0,carryin2,carryout2,sumaResF);
	
endmodule
	