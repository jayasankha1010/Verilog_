
//             
//  Functional Description:  This file contains the Verilog which describes the 
//               FPGA implementation of a fixed/variable 4-bit mux. The inputs 
//               are a, a 4-bit vector, a fixed 4-bit vector, and c, a 6-bit
//               selector, with b, a 4-bit vector as the output.  

/*
module find_errors(      //1 no paren"("
	input [3:0]a,     //2 error -- dimension in wrong place, semi-colon instead of comma 
	output [3:0]b,      //3 : instead of ,
	input [5:0]c);      //4 syntax error; missing')'
	
	wire [3:0]aw;      
	reg [3:0]bw;
	wire [5:0]creg;	    //8 syntax error missing ;
//begin                 // no begin needed here
	assign aw = a;
	assign b = bw;
	assign creg = c;
	always  @(aw or creg)                     //missing sensitivity list
		begin 	
			if (creg == 6'b111111)   //15 incorrect logic test (= instead of ==), array size mismatch
				bw <= aw;       //16 cannot assign to a wire inside of always, bad number format
			else 
				bw <= "0101";   //18 cannot assign to a wire inside of always, bad number format
		end                    //19 extra ";" after end
	//end process;            //20 no end needed
endmodule                       //21 end module
*/

/*
module find_errors(                           // line 1
  input  [3:0]a,                            // line 2
  output [3:0]b,                            // line 3
  input [5:0]c);                               // line 4
                                             // line 5
  wire [3:0]aw;                              // line 6
  reg [3:0]bw;                              // line 7
  reg [5:0]creg;                             // line 8
//begin                                        // line 9
  assign aw = a;                             // line 10
  assign b = bw;                             // line 11
  //assign creg = c;                           // line 12
always @(aw or c)                                      // line 13 
  begin                                      // line 14
    if (c == 5'b111111)   //creg is all 1s     // line 15 
       bw <= aw;                             // line 16  
    else                                     // line 17
     bw <= "0101";                           // line 18   
    end                                     // line 19
  //end process;                               // line 20  
endmodule                                        // line 21   

 */
module find_errors( // line 1

input[0:3] a, // line 2

output[3:0] b, // line 3

input[5:0] c); // line 4

// line 5

wire [0:3]aw; // line 6

reg [3:0]bw; // line 7

wire [5:0]creg; // line 8

//begin // line 9

assign aw = a; // line 10

assign b = bw; // line 11

assign creg = c; // line 12

always @ (a or c) // line 13

begin // line 14

if (creg == 6'b111111) //creg is all 1s // line 15

bw = aw; // line 16

else // line 17

bw = 4'b0101; // line 18

//end; // line 19

end // line 20

endmodule // line 21