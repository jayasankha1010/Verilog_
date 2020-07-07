module FSM(
  input In1,
  input RST,
  input CLK, 
  output reg Out1
);

reg current_state, next_state;
parameter A = 2'b00, B = 2'b01, C = 2'b10;

always @(posedge CLK or negedge RST)
begin: STATE_MEMORY
		if(!RST)
			current_state<=current_state;
		else
			current_state <= next_state;
end

always @(current_state or In1)
begin: NEXT_STATE_LOGIC
	case(current_state)
	A: if(In1==1) next_state = B; else next_state = A;
	B: if(In1==1) next_state = B; else next_state = C;
	C: if(In1==1) next_state = A; else next_state = C;
	endcase
end

always @(current_state)
begin:OUTPUT_LOGIC
	case(current_state)
	 A : Out1 = 0;
	 B : Out1 = 0;
	 C : Out1 = 1;
	endcase
end

endmodule





/*
//signal declaration
	reg [1:0] state;
	reg [1:0] next_state;
	
//body

always @(negedge CLK)
begin
	
	if (state == 2'b10)
		Out1 <= 1;
		
	else
		Out1 <= 0;
end

always @(negedge CLK)
begin
	if (RST == 0)
		state <= 2'b00;
	else begin
	case(state)
	2'b00 : 
		if (In1 == 1)
			state <= 2'b01 ;
		else if (In1==0)
			state <= 2'b00;
	2'b01 : 
		if (In1 == 1)
			state <= 2'b01;
		else if (In1==0)
			state <= 2'b10;		
	
	2'b10 : 
		if (In1 == 1)
			state <= 2'b00;
		else if (In1==0)
			state <= 2'b10;
	
	endcase end
end

endmodule
*/