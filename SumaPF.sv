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
	
	//comparar exponentes
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
	complemento(expRes,expComp);
	
	//Resultado de shift
	logic[22:0] corri;
	
	//shift
	srlN
	mysrlN(resultMux1,expComp,corri);
	
	//variables para la suma
	logic carryin;
	assign carryin = 0;
	logic carryout;
	logic [22:0] sumaRes;
	 
	//suma de mantisas
	sumadorNbits 
	#(23)
	sumaN(corri,resultMux2,carryin,carryout,sumaRes);
	 
	//and del bit de signo
	//logic bitSigno;
	//assign bitSigno = sumaRes[22];
	//logic andRes;
	//PFand
	//myand(bitSigno,1,andRes);
	
	//shift de normalizacion
	srlN
	alineamiento(sumaRes,carryout);
	
	//variables para muxE
	logic [7:0] mE0,mE1;
	logic [7:0] resultMuxE;
	logic controlE;
	assign controlE = expRes[7];
	
	//mux exponentes
	MUXE
	mymuxE(expA, expB, controlE, resultMuxE);
	
	//variables para la suma
	//logic carryin2;
	//assign carryin2 = 0;
	logic carryout2;
	logic [7:0] sumaResF;
	
	//suma para alinearr
	sumadorNbits 
	#(8)
	sumaExp(resultMuxE,0,carryout,carryout2,sumaResF);
	
	//Unir
	assign result = {sign,sumaResF[7:0], sumaRes[22:0]};
		
	
	
endmodule
	