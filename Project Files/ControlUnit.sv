module ControlUnit(input [4:0]Opcode,
						 output [1:0]Alu_op,
						 output [1:0]Alu_control,
						 output RegWr, AluSrcB, RegDest, Mem_Reg, jr_inst, j, jalr,
						 output Sign, MemWr, reset, bez, bnez);
						 
						 
			 
always_comb
begin 
case(Opcode)
5'b00000:
begin // Add
Alu_op   = 2'b11;
Alu_control = 2'b00;
RegWr       = 1'b1; 
AluSrcB  = 1'b0;
RegDest  = 1'b1; 
Mem_Reg  = 1'b0; 
jr_inst   = 1'b0; 
Sign     = 1'b0; 
// MemRd    = 1'b0; 
MemWr    = 1'b0; 
reset    = 1'b0;
bez      = 1'b0; 
bnez     = 1'b0;
j        = 1'b0;
jalr     = 1'b0;	  
end
5'b00001:
begin // Sub
Alu_op   = 2'b11;
Alu_control = 2'b11;
RegWr       = 1'b1; 
AluSrcB  = 1'b0;
RegDest  = 1'b1; 
Mem_Reg  = 1'b0; 
jr_inst   = 1'b0; 
Sign     = 1'b0; 
// MemRd    = 1'b0; 
MemWr    = 1'b0; 
reset    = 1'b0;
bez      = 1'b0; 
bnez     = 1'b0;
j        = 1'b0;
jalr     = 1'b0;	  	  
end
5'b00010:
begin // And
Alu_op   = 2'b00;
Alu_control = 2'b00;
RegWr       = 1'b1; 
AluSrcB  = 1'b0;
RegDest  = 1'b1; 
Mem_Reg  = 1'b0; 
jr_inst   = 1'b0; 
Sign     = 1'b0; 
// MemRd    = 1'b0; 
MemWr    = 1'b0; 
reset    = 1'b0;
bez      = 1'b0; 
bnez     = 1'b0;
j        = 1'b0;
jalr     = 1'b0;	     
end
5'b00011:
begin // Or
Alu_op   = 2'b01;
Alu_control = 2'b00;
RegWr       = 1'b1; 
AluSrcB  = 1'b0;
RegDest  = 1'b1; 
Mem_Reg  = 1'b0; 
jr_inst   = 1'b0; 
Sign     = 1'b0; 
// MemRd    = 1'b0; 
MemWr    = 1'b0; 
reset    = 1'b0;
bez      = 1'b0; 
bnez     = 1'b0;
j        = 1'b0;
jalr     = 1'b0;	    
end
5'b00100:
begin // Xor
Alu_op   = 2'b10;
Alu_control = 2'b00;
RegWr       = 1'b1; 
AluSrcB  = 1'b0;
RegDest  = 1'b1; 
Mem_Reg  = 1'b0; 
jr_inst   = 1'b0; 
Sign     = 1'b0; 
// MemRd    = 1'b0; 
MemWr    = 1'b0; 
reset    = 1'b0;
bez      = 1'b0; 
bnez     = 1'b0;
j        = 1'b0;
jalr     = 1'b0;	  
end
5'b00101:
begin // SLT
Alu_op   = 2'b11;
Alu_control = 2'b01;
RegWr       = 1'b1; 
AluSrcB  = 1'b0;
RegDest  = 1'b1; 
Mem_Reg  = 1'b0; 
jr_inst   = 1'b0; 
Sign     = 1'b0; 
// MemRd    = 1'b0; 
MemWr    = 1'b0; 
reset    = 1'b0;
bez      = 1'b0; 
bnez     = 1'b0;
j        = 1'b0;
jalr     = 1'b0;	  	  
end
5'b00110:
begin // SLTU
Alu_op   = 2'b11;
Alu_control = 2'b10;
RegWr       = 1'b1; 
AluSrcB  = 1'b0;
RegDest  = 1'b1; 
Mem_Reg  = 1'b0; 
jr_inst   = 1'b0; 
Sign     = 1'b0; 
// MemRd    = 1'b0; 
MemWr    = 1'b0; 
reset    = 1'b0;
bez      = 1'b0; 
bnez     = 1'b0;
j        = 1'b0;
jalr     = 1'b0;	   
end
5'b00111:
begin // Unused
Alu_op   = 2'b11;
Alu_control = 2'b00;
RegWr       = 1'b1; 
AluSrcB  = 1'b0;
RegDest  = 1'b1; 
Mem_Reg  = 1'b0; 
jr_inst   = 1'b0; 
Sign     = 1'b0; 
// MemRd    = 1'b0; 
MemWr    = 1'b0; 
reset    = 1'b0;
bez      = 1'b0; 
bnez     = 1'b0;
j        = 1'b0;
jalr     = 1'b0;	  
end
5'b01000:
begin // Add Immediate
Alu_op   = 2'b11;
Alu_control = 2'b00;
RegWr       = 1'b1; 
AluSrcB  = 1'b1;
RegDest  = 1'b0; 
Mem_Reg  = 1'b0; 
jr_inst   = 1'b0; 
Sign     = 1'b1; 
// MemRd    = 1'b0; 
MemWr    = 1'b0; 
reset    = 1'b0;
bez      = 1'b0; 
bnez     = 1'b0;
j        = 1'b0;
jalr     = 1'b0;	   
end
5'b01001:
begin // Unused
Alu_op   = 2'b00;
Alu_control = 2'b00;
RegWr       = 1'b0; 
AluSrcB  = 1'b0;
RegDest  = 1'b0; 
Mem_Reg  = 1'b0; 
jr_inst   = 1'b0; 
Sign     = 1'b0; 
// MemRd    = 1'b0; 
MemWr    = 1'b0; 
reset    = 1'b0;
bez      = 1'b0; 
bnez     = 1'b0;
j        = 1'b0;
jalr     = 1'b0;	 
end
5'b01010:
begin // And immediate
Alu_op   = 2'b00;
Alu_control = 2'b00;
RegWr       = 1'b1; 
AluSrcB  = 1'b1;
RegDest  = 1'b0; 
Mem_Reg  = 1'b0; 
jr_inst   = 1'b0; 
Sign     = 1'b1; 
// MemRd    = 1'b0; 
MemWr    = 1'b0; 
reset    = 1'b0;
bez      = 1'b0; 
bnez     = 1'b0;
j        = 1'b0;
jalr     = 1'b0;	 
end
5'b01011:
begin // Or immediate
Alu_op   = 2'b01;
Alu_control = 2'b00;
RegWr       = 1'b1; 
AluSrcB  = 1'b1;
RegDest  = 1'b0; 
Mem_Reg  = 1'b0; 
jr_inst   = 1'b0; 
Sign     = 1'b0; 
// MemRd    = 1'b0; 
MemWr    = 1'b0; 
reset    = 1'b0;
bez      = 1'b0; 
bnez     = 1'b0;
j        = 1'b0;
jalr     = 1'b0;	 	
end
5'b01100:
begin // Xor immediate
Alu_op   = 2'b10;
Alu_control = 2'b00;
RegWr       = 1'b1; 
AluSrcB  = 1'b1;
RegDest  = 1'b0; 
Mem_Reg  = 1'b0; 
jr_inst   = 1'b0; 
Sign     = 1'b0; 
// MemRd    = 1'b0; 
MemWr    = 1'b0; 
reset    = 1'b0;
bez      = 1'b0; 
bnez     = 1'b0;
j        = 1'b0;
jalr     = 1'b0;	 
end
5'b01101:
begin // SLT immediate
Alu_op   = 2'b11;
Alu_control = 2'b01;
RegWr       = 1'b1; 
AluSrcB  = 1'b1;
RegDest  = 1'b0; 
Mem_Reg  = 1'b0; 
jr_inst   = 1'b0; 
Sign     = 1'b1; 
// MemRd    = 1'b0; 
MemWr    = 1'b0; 
reset    = 1'b0;
bez      = 1'b0; 
bnez     = 1'b0;
j        = 1'b0;
jalr     = 1'b0;	  
end
5'b01110:
begin // SLTU immediate
Alu_op   = 2'b11;
Alu_control = 2'b10;
RegWr       = 1'b1; 
AluSrcB  = 1'b1;
RegDest  = 1'b0; 
Mem_Reg  = 1'b0; 
jr_inst   = 1'b0; 
Sign     = 1'b1; 
// MemRd    = 1'b0; 
MemWr    = 1'b0; 
reset    = 1'b0;
bez      = 1'b0; 
bnez     = 1'b0;
j        = 1'b0;
jalr     = 1'b0;	 
end
5'b01111:
begin // unused
Alu_op   = 2'b00;
Alu_control = 2'b00;
RegWr       = 1'b0; 
AluSrcB  = 1'b0;
RegDest  = 1'b0; 
Mem_Reg  = 1'b0; 
jr_inst   = 1'b0; 
Sign     = 1'b0; 
// MemRd    = 1'b0; 
MemWr    = 1'b0; 
reset    = 1'b0;
bez      = 1'b0; 
bnez     = 1'b0;
j        = 1'b0;
jalr     = 1'b0;	  
end
5'b10000:
begin // Bez 
Alu_op   = 2'b00;
Alu_control = 2'b00;
RegWr       = 1'b0; 
AluSrcB  = 1'b0;
RegDest  = 1'b0; 
Mem_Reg  = 1'b0; 
jr_inst   = 1'b0; 
Sign     = 1'b1; 
// MemRd    = 1'b0; 
MemWr    = 1'b0; 
reset    = 1'b1;
bez      = 1'b1; 
bnez     = 1'b0;
j        = 1'b0;
jalr     = 1'b0;	  
end
5'b10001: 
begin // Bnez
Alu_op   = 2'b00;
Alu_control = 2'b00;
RegWr       = 1'b0; 
AluSrcB  = 1'b0;
RegDest  = 1'b0; 
Mem_Reg  = 1'b0; 
jr_inst   = 1'b0; 
Sign     = 1'b1; 
// MemRd    = 1'b0; 
MemWr    = 1'b0; 
reset    = 1'b1;
bez      = 1'b0; 
bnez     = 1'b1;
j        = 1'b0;
jalr     = 1'b0;	
end
5'b10010:
begin // Load Word
Alu_op   = 2'b00;
Alu_control = 2'b00;
RegWr       = 1'b1; 
AluSrcB  = 1'b0;
RegDest  = 1'b0; 
Mem_Reg  = 1'b1; 
jr_inst   = 1'b0; 
Sign     = 1'b1; 
// MemRd    = 1'b1; 
MemWr    = 1'b0; 
reset    = 1'b0;
bez      = 1'b0; 
bnez     = 1'b0;
j        = 1'b0;
jalr     = 1'b0;
end
5'b10011:
begin // store Word
Alu_op   = 2'b00;
Alu_control = 2'b00;
RegWr       = 1'b0; 
AluSrcB  = 1'b0;
RegDest  = 1'b0; 
Mem_Reg  = 1'b1; 
jr_inst   = 1'b0; 
Sign     = 1'b1; 
// MemRd    = 1'b0; 
MemWr    = 1'b1; 
reset    = 1'b0;
bez      = 1'b0; 
bnez     = 1'b0;
j        = 1'b0;
jalr     = 1'b0;	
end
5'b10100:
begin // Unused
Alu_op   = 2'b00;
Alu_control = 2'b00;
RegWr       = 1'b0; 
AluSrcB  = 1'b0;
RegDest  = 1'b0; 
Mem_Reg  = 1'b0; 
jr_inst   = 1'b0; 
Sign     = 1'b0; 
// MemRd    = 1'b0; 
MemWr    = 1'b0; 
reset    = 1'b0;
bez      = 1'b0; 
bnez     = 1'b0;
j        = 1'b0;
jalr     = 1'b0;	
end
5'b10101:
begin // Unused
Alu_op   = 2'b00;
Alu_control = 2'b00;
RegWr       = 1'b0; 
AluSrcB  = 1'b0;
RegDest  = 1'b0; 
Mem_Reg  = 1'b0; 
jr_inst   = 1'b0; 
Sign     = 1'b0; 
// MemRd    = 1'b0; 
MemWr    = 1'b0; 
reset    = 1'b0;
bez      = 1'b0; 
bnez     = 1'b0;
j        = 1'b0;
jalr     = 1'b0;	
end
5'b10110:
begin // Unused
Alu_op   = 2'b00;
Alu_control = 2'b00;
RegWr       = 1'b0; 
AluSrcB  = 1'b0;
RegDest  = 1'b0; 
Mem_Reg  = 1'b0; 
jr_inst   = 1'b0; 
Sign     = 1'b0; 
// MemRd    = 1'b0; 
MemWr    = 1'b0; 
reset    = 1'b0;
bez      = 1'b0; 
bnez     = 1'b0;
j        = 1'b0;
jalr     = 1'b0;		
end
5'b10111:
begin // Unused
Alu_op   = 2'b00;
Alu_control = 2'b00;
RegWr       = 1'b0; 
AluSrcB  = 1'b0;
RegDest  = 1'b0; 
Mem_Reg  = 1'b0; 
jr_inst   = 1'b0; 
Sign     = 1'b0; 
// MemRd    = 1'b0; 
MemWr    = 1'b0; 
reset    = 1'b0;
bez      = 1'b0; 
bnez     = 1'b0;
j        = 1'b0;
jalr     = 1'b0;		
end
5'b11000:
begin // Unused
Alu_op   = 2'b00;
Alu_control = 2'b00;
RegWr       = 1'b0; 
AluSrcB  = 1'b0;
RegDest  = 1'b0; 
Mem_Reg  = 1'b0; 
jr_inst   = 1'b0; 
Sign     = 1'b0; 
// MemRd    = 1'b0; 
MemWr    = 1'b0; 
reset    = 1'b0;
bez      = 1'b0; 
bnez     = 1'b0;
j        = 1'b0;
jalr     = 1'b0;	
end
5'b11001:
begin // Jump
Alu_op   = 2'b00;
Alu_control = 2'b00;
RegWr       = 1'b0; 
AluSrcB  = 1'b0;
RegDest  = 1'b0; 
Mem_Reg  = 1'b0; 
jr_inst   = 1'b0; 
Sign     = 1'b0; 
// MemRd    = 1'b0; 
MemWr    = 1'b0; 
reset    = 1'b1;
bez      = 1'b0; 
bnez     = 1'b0;
j        = 1'b1;
jalr     = 1'b0;	
end
5'b11010:
begin // Jalr
Alu_op   = 2'b00;
Alu_control = 2'b00;
RegWr       = 1'b1; 
AluSrcB  = 1'b0;
RegDest  = 1'b0; 
Mem_Reg  = 1'b0; 
jr_inst   = 1'b0; 
Sign     = 1'b0; 
// MemRd    = 1'b0; 
MemWr    = 1'b0; 
reset    = 1'b1;
bez      = 1'b0; 
bnez     = 1'b0;
j        = 1'b1;
jalr     = 1'b1;	
end
5'b11011:
begin // Unused
Alu_op   = 2'b00;
Alu_control = 2'b00;
RegWr       = 1'b0; 
AluSrcB  = 1'b0;
RegDest  = 1'b0; 
Mem_Reg  = 1'b0; 
jr_inst   = 1'b0; 
Sign     = 1'b0; 
// MemRd    = 1'b0; 
MemWr    = 1'b0; 
reset    = 1'b1;
bez      = 1'b0; 
bnez     = 1'b0;
j        = 1'b1;
jalr     = 1'b0;		
end
5'b11100:
begin // Jump register
Alu_op   = 2'b00;
Alu_control = 2'b00;
RegWr       = 1'b0; 
AluSrcB  = 1'b0;
RegDest  = 1'b0; 
Mem_Reg  = 1'b0; 
jr_inst   = 1'b1; 
Sign     = 1'b0; 
// MemRd    = 1'b0; 
MemWr    = 1'b0; 
reset    = 1'b1;
bez      = 1'b0; 
bnez     = 1'b0;
j        = 1'b1;
jalr     = 1'b0;	
end
5'b11101:
begin // Unused
Alu_op   = 2'b00;
Alu_control = 2'b00;
RegWr       = 1'b0; 
AluSrcB  = 1'b0;
RegDest  = 1'b0; 
Mem_Reg  = 1'b0; 
jr_inst   = 1'b0; 
Sign     = 1'b0; 
// MemRd    = 1'b0; 
MemWr    = 1'b0; 
reset    = 1'b0;
bez      = 1'b0; 
bnez     = 1'b0;
j        = 1'b0;
jalr     = 1'b0;		
end
5'b11110:
begin // Unused
Alu_op   = 2'b00;
Alu_control = 2'b00;
RegWr       = 1'b0; 
AluSrcB  = 1'b0;
RegDest  = 1'b0; 
Mem_Reg  = 1'b0; 
jr_inst   = 1'b0; 
Sign     = 1'b0; 
// MemRd    = 1'b0; 
MemWr    = 1'b0; 
reset    = 1'b0;
bez      = 1'b0; 
bnez     = 1'b0;
j        = 1'b0;
jalr     = 1'b0;	
end
5'b11111:
begin // Unused
Alu_op   = 2'b00;
Alu_control = 2'b00;
RegWr       = 1'b0; 
AluSrcB  = 1'b0;
RegDest  = 1'b0; 
Mem_Reg  = 1'b0; 
jr_inst   = 1'b0; 
Sign     = 1'b0; 
// MemRd    = 1'b0; 
MemWr    = 1'b0; 
reset    = 1'b0;
bez      = 1'b0; 
bnez     = 1'b0;
j        = 1'b0;
jalr     = 1'b0;	
end
endcase
end 
 
endmodule