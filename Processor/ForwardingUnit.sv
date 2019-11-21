module ForwardingUnit(input logic ID_EX_MEM_RegWr, 
                      input logic [2:0] ID_EX_MEM_Rt_or_rd, 
							 input logic [2:0] IF_ID_Rs, 
							 input logic [2:0] IF_ID_Rt, 
                      input logic EX_MEM_WB_RegWr, 
							 input logic [2:0] EX_MEM_WB_Rt_or_rd,
							 output logic [1:0] FA, FB);
							 
always_comb
begin
if (ID_EX_MEM_RegWr & ID_EX_MEM_Rt_or_rd & (ID_EX_MEM_Rt_or_rd == IF_ID_Rs))
FA = 2'b10;
else if (EX_MEM_WB_RegWr & EX_MEM_WB_Rt_or_rd & (EX_MEM_WB_Rt_or_rd == IF_ID_Rs))
FA = 2'b01;
else
FA = 2'b00;

if (ID_EX_MEM_RegWr & ID_EX_MEM_Rt_or_rd & (ID_EX_MEM_Rt_or_rd == IF_ID_Rt))
FB = 2'b10;
else if (EX_MEM_WB_RegWr & EX_MEM_WB_Rt_or_rd & (EX_MEM_WB_Rt_or_rd == IF_ID_Rt))
FB = 2'b01;
else
FB = 2'b00;
end

endmodule