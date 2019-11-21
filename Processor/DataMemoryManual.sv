module DataMemoryManual(input logic [7:0]address,
						  input logic [7:0]data,
						  input clk, init,
						  input logic Wren,
						  output logic [7:0]q);

integer i;
reg [7:0] outputRegister[7:0];
						  
always_ff@(posedge clk)
begin

   if (init)
	
	begin
	outputRegister[0] <= 8'b00000111;
	outputRegister[1] <= 8'b00000111;
	outputRegister[2] <= 8'b00000111;
	outputRegister[3] <= 8'b00000111;
	outputRegister[4] <= 8'b00000111;
	outputRegister[5] <= 8'b00000111;
	outputRegister[6] <= 8'b00000111;
	outputRegister[7] <= 8'b00000111;
	end


	else if (Wren)
	
	begin
	outputRegister[address] <= data;
	end
	
end

always_comb
begin
q = outputRegister[address];
end

endmodule

