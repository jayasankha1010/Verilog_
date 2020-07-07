/*module LS161a(
    input [3:0] D,        // Parallel Input
    input CLK,            // Clock
    input CLR_n,          // Active Low Asynchronous Reset
    input LOAD_n,         // Enable Parallel Input
    input ENP,            // Count Enable Parallel
    input ENT,            // Count Enable Trickle
    output reg [3:0]Q,        // Parallel Output 	
    output reg RCO            // Ripple Carry Output (Terminal Count)
); 

always @(posedge CLK or negedge CLR_n)
begin 
	if(!CLR_n) begin
		Q <= 4'b0000;
		RCO <= 0; end
	
	else if (!LOAD_n) begin
		Q <=  D;
		RCO <= 0; end
		
	else if (ENP && ENT) begin
		Q <= Q+1;
		begin
			if (Q == 4'b0000)
				RCO <= 1;
		end end

	
end

endmodule */


module LS161a(
    input [3:0] D,        // Parallel Input
    input CLK,            // Clock
    input CLR_n,          // Active Low Asynchronous Reset
    input LOAD_n,         // Enable Parallel Input
    input ENP,            // Count Enable Parallel
    input ENT,            // Count Enable Trickle
    output [3:0]Q,        // Parallel Output    
    output RCO            // Ripple Carry Output (Terminal Count)
); 
reg [3:0]temp;

always @(posedge CLK)
begin
    if (CLR_n==0)
        temp<=0000;
    else if (CLR_n==1)
    begin
        if (LOAD_n == 0)

            temp<=D;
        else if (ENP==1 & ENT==1)
            temp<=temp+1;
    end 
end

assign Q=temp;
assign RCO = temp[3]& temp[2]& temp[1]& temp[0]& ENT;
endmodule