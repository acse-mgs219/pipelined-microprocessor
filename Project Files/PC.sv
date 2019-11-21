module PC (input [7:0] address,
           input [7:0] jumpAddress, jrAddress, BranchAddress, jalrAddress,
			  input j, jr, bra, jalr,
			  input clk, rst,
			  output logic [7:0] q);
			  
always_ff@(posedge clk)

if (rst)
   q <= 8'b0000000;
else if (j)
	q <= jumpAddress;
else if (jr)
	q <= jrAddress;
else if (bra)
	q <= BranchAddress;
else if (jalr)
   q <= jalrAddress;
else 
   q <= address + 1'b1 ;
	
endmodule