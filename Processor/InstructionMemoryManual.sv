module InstructionMemoryManual(input logic [7:0]address,
						  input clk, init,
						  output logic [15:0]q);

integer i;
reg [255:0] outputInst[15:0];
						  
always_ff@(posedge clk)
begin


	if (init)
	
	begin
	outputInst[0] <= 16'b1001011011000000;
	outputInst[1] <= 16'b1001011011000000;
	outputInst[2] <= 16'b1100100000000110;
	outputInst[3] <= 16'b1001011011000000;
	outputInst[4] <= 16'b0100011111100011;
	outputInst[5] <= 16'b0100011111100011;
	outputInst[6] <= 16'b0100011111100011;
	outputInst[7] <= 16'b0100011011000011;
	outputInst[8] <= 16'b1001011111100000;
	outputInst[9] <= 16'b0000011111000100;
	outputInst[10] <= 16'b0101000101001110;
	outputInst[11] <= 16'b0000001000101100;
	outputInst[12] <= 16'b0000011111001100;
	outputInst[13] <= 16'b1100110100001101;
	end
	
end

always_comb
begin
q = outputInst[address];
end

endmodule

