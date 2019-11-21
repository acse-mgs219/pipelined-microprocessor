module EX_MEM_WB_Reg (input logic [7:0] inputtt,
	          input logic [2:0] rt_or_rd,
				 input logic [2:0] RSF,
				 input logic regWr,
             input clk,
				 input logic [7:0] PCP1WB,
				 input logic jalrFINAL,
  	          output logic [7:0] outputtt,
	          output logic [2:0] rt_or_rdO,
				 output logic [2:0] RSFO,
				 output logic regWrO,
				 output logic [7:0] PCP1WBO,
				 output logic jalrFINALO);

logic [23:0] d;
logic [23:0] q;

always_comb
begin
d = {jalrFINAL, RSF[2:0], PCP1WB[7:0], regWr, inputtt[7:0], rt_or_rd[2:0]};
end

always_ff@(posedge clk)
begin
q <= d;
end

always_comb
begin

jalrFINALO = q[23];
RSFO = q[22:20];
PCP1WBO = q[19:12];
regWrO = q[11];
outputtt = q[10:3];
rt_or_rdO = q[2:0];

end
endmodule