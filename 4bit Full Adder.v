

module FullAdd4( A,B,Cin,Sum,Cout);                	
    input [3:0] A, B;
    input Cin; 			
    output [3:0] Sum;
    output Cout;

    assign {Cout,Sum} = A+B+Cin;             	          	
// student code here


endmodule 




    