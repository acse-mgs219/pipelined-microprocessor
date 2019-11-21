module IF_ID_Reg (input logic [15:0]Instruction,
	          input logic [7:0]PCp1in,
             input logic clk, rst,
  	          output logic [4:0]opcode,
	          output logic [7:0]PCp1out,
	          output logic [2:0]rs,
	          output logic [2:0]rt,
	          output logic [2:0]rd,
	          output logic [7:0]jaddr,
	          output logic [4:0]imm5);

logic [23:0] d; 
logic [23:0] q;

always_comb
begin
d = {Instruction, PCp1in};
end


always_ff@(posedge clk)
begin
if (rst)
   q <= 0;
else
   q <= d;
end

always_comb
begin

opcode = q[23:19];
rs = q[18:16];
rt = q[15:13];
rd = q[12:10];
imm5 = q[12:8];
jaddr = q[15:8];
PCp1out = q[7:0];

end
endmodule