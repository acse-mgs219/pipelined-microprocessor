module ID_EX_MEM_Reg (input logic [7:0]Ain,
	          input logic [7:0]Bin,
	          input logic [2:0]rd_in,
	          input logic [2:0]rt_in,
	          input logic [7:0]imm8_in,
		       input logic [7:0]jaddr_in,
				 input logic [7:0]PCp1_in,
				 input logic memToReg, regWr, aluSrcB, twoTo1Sel, jalr, memWr,
				 input logic [1:0] AluOP, AluCtrl,
             input clk,
				 input logic [2:0] RSI,
  	          output logic [7:0] Aout,
	          output logic [7:0] Bout,
	          output logic [7:0] imm8_out,
	          output logic [2:0] rd_out,
	          output logic [2:0] rt_out,
	          output logic [7:0] jaddr_out,
				 output logic [7:0] PCp1_out,
				 output logic memToRegO, regWrO, aluSrcBO, twoTo1SelO, jalrO, memWrO,
				 output logic [1:0] AluOPO, AluCtrlO,
				 output logic [2:0] RSO);

logic [58:0] d;
logic [58:0] q;

always_comb
begin
d = {RSI, memToReg, regWr, aluSrcB, twoTo1Sel, jalr, memWr, AluOP[1:0], AluCtrl[1:0], PCp1_in[7:0],Ain[7:0],Bin[7:0],rd_in[2:0],rt_in[2:0],imm8_in[7:0],jaddr_in[7:0]};
end

always_ff@(posedge clk)
begin
q <= d;
end

always_comb
begin

RSO = q[58:56];
memToRegO = q[55];
regWrO = q[54];
aluSrcBO = q[53];
twoTo1SelO=q[52];
jalrO=q[51];
memWrO=q[50];
AluOPO = q[49:48];
AluCtrlO = q[47:46];
PCp1_out = q[45:38];
Aout = q[37:30];
Bout = q[29:22];
rd_out = q[21:19];
rt_out = q[18:16];
imm8_out = q[15:8];
jaddr_out = q[7:0];

end
endmodule