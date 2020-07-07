 module Comparator2(
   input[1:0] A, B,
   output /*reg*/ Equals);

   /*always 
   begin: compare @(A or B)
      Equals = 0;
      if (A==B)
         Equals=1;
   end  */    		
                   	          	
// student code here
assign Equals = &((A~^B));

endmodule // Comparator2 




    