
//  Functional Description:  This file contains the Verilog which describes the 
//               FPGA implementation of Majority Vote circuit. The inputs are 3 
//               scalars A, B, and C with Y as the output.

  	                                            		
module Majority (A, B, C, Y);                 	
    input  A, B, C;			
    output Y; 

    reg Y;           		
                   	          	
// student code here

	always @(A or B or C)
	begin
		Y = (A&B)|(A&C)|(B&C);
	end
endmodule // Majority  




    