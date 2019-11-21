module SignExtensionUnit(input [4:0] imm,
								 input sign,
					    		 output [7:0]immEx);
										  

always
begin 
if(sign)
immEx = { imm[4],imm[4],imm[4],imm[4],imm[3],imm[2],imm[1],imm[0]};
else
immEx = { 1'b0, 1'b0, 1'b0,imm[4],imm[3],imm[2],imm[1],imm[0]};
end

endmodule 