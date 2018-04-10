module complement(input logic[7: 0] A,
	 output logic[7: 0] Q);
	 
	 //Bit mas significativo para hacer el xor
	 logic msb;
	 assign msb = A[7];
	 
	 //resultado del xor
	 logic [7:0] res;
	 
	 //bits para xor con bit msb (1 o 0)
	 logic [7:0] xorbits;
	 
	 //bits para suma de uno
	 logic [7:0] sum;
	 assign sum = 8'b00000001;
	 //carry in para la suma
	 logic carryin;
	 assign carryin = 0;
	 logic carryout;
		
	 always @* begin
		if(msb==0) begin
			xorbits<=8'b00000000;
		end
		else begin
			xorbits<=8'b11111111;
		end
	 end
	 
	 
	 XORN
	 xorn(xorbits,A,res);
	 
	 sumadorNbits 
	 #(8)
	 sumaN(res,sum,carryin,carryout,Q);
	 
	 
endmodule
