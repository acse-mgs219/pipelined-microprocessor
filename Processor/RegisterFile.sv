module RegisterFile(input logic [2:0]RR1,
                    input logic [2:0]RR2,
						  input logic [2:0]WR,
						  input logic [7:0]WD,
						  input clk,
						  input logic RegWr,
						  output logic [7:0]RD1,
						  output logic [7:0]RD2);

reg [7:0] outputRegister[7:0];
						  
always_ff@(posedge clk)
begin


	if (RegWr & WR)
	
	begin
	outputRegister[WR] <= WD;
	end
	
end

always_comb
begin
RD1 = outputRegister[RR1];
RD2 = outputRegister[RR2];
end

endmodule