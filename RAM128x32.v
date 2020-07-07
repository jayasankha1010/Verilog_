module RAM128x32 
#(
  parameter Data_width = 32,  //# of bits in word
            Addr_width = 7  // # of address bits
  )
  (  //ports
    input wire clk,
    input wire we,
    input wire [(Addr_width-1):0] address, 
    input wire [(Data_width-1):0] d,
    output wire [(Data_width-1):0] q
  );

//Signal declaration
	reg [Data_width-1:0] ram [2**Addr_width-1:0]; //for ram storage
	reg [Data_width-1:0] data_reg; //Output register

assign q = data_reg;
	
//RAM initializing from a external file
initial $readmemh("initialRAM",ram);

//body
//operation

always @(posedge clk)
begin
	if (we)
		ram[address] <= d;
	data_reg <= ram[address];
	
end

endmodule