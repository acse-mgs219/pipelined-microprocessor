module EmbeddedProject(input [7:0]d_PC,
					  input [15:0] data_IM,
					  input clk, srst, wren_IM, user_RF,
					  input [2:0]user_addr_RF1,user_addr_RF2,
					  output [15:0]IR_out,
					  output [7:0] RFout_ForwardingMux1in, RFout_ForwardingMux2in,JrMuxout_RFinDW, ALUout_Reg2in,
					  output [45:0] output_Reg1,
					  output [29:0] output_Reg2,
					  output [16:0]ControlUnit_out,
					  output [7:0]PCout_IMin,
					  output [2:0]DstRegout_Reg2in,
					  output [7:0]ALU_Muxout_ALUin,A_Reg1out_Aluin,SEout_ALUmuxin,
					  output [4:0] Immediate_Reg1out_SEin);

					  
//logic [7:0]RFout_ForwardingMux1in, RFout_ForwardingMux2in;					  
logic [15:0] IMout_IRin;
logic PC_en = 1'b0;
logic [7:0] SEout_Shiftin;
logic [7:0] PCout_Regin;
//logic [7:0]SEout_ALUmuxin;
logic [7:0]PCReg1Out_PCReg2in;
logic [7:0]A_Reg1out_Forwarding1in;
logic [7:0]B_Reg1out_Forwarding2in;
logic [7:0]Forwarding1out_ALUPortAin;
logic [7:0]Forwarding2out_ALUMuxin;
logic [7:0]Data_DMout_Reg2in;
//logic [7:0]ALU_Muxout_ALUin;
logic [7:0]MemMuxout_JrMuxin;
logic [7:0]DMR_Reg2out_MemMuxin;
logic [7:0]ALU_Reg2out_MemMuxin;
logic [7:0]PC_Reg2out_JrMuxin, B_Reg1out_ALUMuxin;
logic [7:0]A_Forwaring1Muxout_Reg1in, B_Forwaring2Muxout_Reg2in;
//logic [7:0]A_Reg2out_Aluin;
logic [2:0]ALU_CUout_Regin;
logic [2:0]RT_Reg1out_Dst_Muxin;
logic [2:0]RD_Reg1out_Dst_Muxin;
logic [2:0]ALUOPReg1out_ALUSin;
logic [2:0] Reg1_RSout_DMAddressin;
//logic [2:0] DstRegout_Reg2in;
logic [2:0]RSRT_Reg2out_RFin;
logic [1:0] FU1out_ForwardingMux1in;
logic [1:0] FU2out_ForwardingMux2in;
logic LogicForBrachingout_PCin;

logic WB_CUout_Regin, LogicForBranchingout_PCin;
logic j_CUout_PCin;
logic jalr_CUout_PCin;
logic rstPC_CUout_PCin;
logic MemRd_CUout_Regin;
logic MemWr_CUout_Regin;
logic ALU_Reg_CUout_Regin;
logic Dst_Reg_CUout_Regin;
logic Mem_Reg_CUout_Regin;
logic rst_IR, bra, bran ;
logic signOfImmediate;
//logic [4:0]Immediate_Reg1out_SEin;
logic MemRd_Reg1out;
logic MemWr_Reg1out_DMin;
logic MemReg_Reg1out_Reg2in;
logic jr_Reg1out_Reg2in;
logic ALU_Reg1out_ALU_Muxin;
logic Dst_Reg1out_Dst_Muxin;
logic Sing_Reg1out_Immediatein;
logic MemReg_Reg1in_Reg2out;
logic jr_Reg_CUout_Reg1in;
logic WB_Reg2out_RFin;
logic MemReg_Reg2out_MemMuxin;
logic Jr_Reg2in_JrMuxin;
logic WB_Reg1out_Reg2in;


// PC Register Connected to the istuction memory and has input and jump, jalr, branch


//COMPLETE BUT NEEDS REVISION	
PC_Register PC_Register1( .d(d_PC), 
						        .jump(IR_out[7:0]), .A(RFout_ForwardingMux1in),
								  .branch_content(IR_out[7:0]), // jump come from IR, BRANCH from IR THEN SignExtention the shift by  two, A is from jalr from the output of RF
						        .srst(srst),.rst(rstPC_CUout_PCin), .en(PC_en), 
						        .clk(clk), .j(j_CUout_PCin), .jalr(jalr_CUout_PCin),
						        .bra(LogicForBranchingout_PCin), //controll units from jump, bra, jalr
						        .q(PCout_IMin)); // output of PC going to the IM
						 

//COMPLETE BUT NEEDS REVISION	
InstructionMemory InstructionMemorry1(.address(PCout_IMin), // the output of PC in the input of address of IM
												  .clock(clk),   
												  .data(data_IM), // Instruction are set by the user as input
												  .wren(wren_IM), // wren is controlled by the user
												  .q(IMout_IRin)); //wren from writing to the IM input by the user

												  //COMPLETE BUT NEEDS REVISION	
Instruction_Register Instruction_Register1(.d(IMout_IRin), // Output data from the instruction memory in the input the IR
														 .srst(srst), // Controlled by the user
														 .rst(rst_IR), // rst of the IR if controlled by the CU
														 .clk(clk),  
														 .q(IR_out)); // IR output 
						 

						 //INCOMPLETE						 
Control_Unit Control_Unit1(.OPCODE(IR_out[15:11]), // to get the opcode the first 5 bit of IR output is input to the CU
								.Alu_op(ALU_CUout_Regin),
								.WB(WB_CUout_Regin), .Alu_Reg(ALU_Reg_CUout_Regin),
								.Dst_Reg(Dst_Reg_CUout_Regin), .Mem_Reg(Mem_Reg_CUout_Regin),
								.jr_Reg(jr_Reg_CUout_Reg1in), .j(j_CUout_PCin), .jalr(jalr_CUout_PCin),
								.Sign(signOfImmediate), .MemRd(MemRd_CUout_Regin),
								.MemWr(MemWr_CUout_Regin), .rst_IR(rst_IR),
								.rst_PC(rstPC_CUout_PCin), .bez(bra), .bnez(bran),
								.y(ControlUnit_out));
						 

	
//COMPLETE BUT NEEDS REVISION					  
Logic_for_bez Logic_for_bez1(.a(A_Forwaring1Muxout_Reg1in),
									  .bra(bra), // is the controll unit gives branch if equal
							        .bran(bran), // is the controll unit gives branch if not equal
							        .y(LogicForBranchingout_PCin)); // the logic of this control weather the immediate data get put in the pc
	
	
//INCOMPLETE
//RegisterFile RegisterFile1( .rr1(IR_out[10:8]), .rr2(IR_out[7:5]), .wr(RSRT_Reg2out_RFin),
//							.DW(JrMuxout_RFinDW),
//							.WB(WB_Reg2out_RFin), .clk(clk),
//							.R1(RFout_ForwardingMux1in), .R2(RFout_ForwardingMux2in));
							 
RegisterFile  RegisterFile1(.clk(clk),.rst(srst),
									 .write(WB_Reg2out_RFin),.user(user_RF),
									 .r1_addr(IR_out[10:8]),.r2_addr(IR_out[7:5]),.user_addr1(user_addr_RF1),.user_addr2(user_addr_RF2),
									 .wr_addr(RSRT_Reg2out_RFin),.wr_data(JrMuxout_RFinDW),
									 .r1_data(RFout_ForwardingMux1in),.r2_data(RFout_ForwardingMux2in));
							 
//COMPLETE			 
PC PC1(.d(PCout_IMin), // the address is being carried Pc is the one above IR
		 .clk(clk),
		 .q(PCout_Regin));
		 
			 
//INCOMPLETE
REG1 REG1_1(.PC(PCout_Regin),   // Dont forget the HDU
				.A(A_Forwaring1Muxout_Reg1in), .B(B_Forwaring2Muxout_Reg2in),
				.Immediate(IR_out[4:0]),
				.RD(IR_out[4:2]), .RT(IR_out[7:5]),
				.ALU_OP(ALU_CUout_Regin), // RS IS THE RD 
				.WB(WB_CUout_Regin), .ALU_Reg(ALU_Reg_CUout_Regin), 
				.Dst_Reg(Dst_Reg_CUout_Regin), .Mem_Reg(Mem_Reg_CUout_Regin),
				.Sign(signOfImmediate), .MemRd(MemRd_CUout_Regin), 
				.MemWr(MemWr_CUout_Regin),.clk(clk),.jr_Reg(jr_Reg_CUout_Reg1in),
				.PC_out(PCReg1Out_PCReg2in),
				.A_out(A_Reg1out_Aluin), .B_out(B_Reg1out_ALUMuxin),
				.Immediate_out(Immediate_Reg1out_SEin),
			   .RT_out(RT_Reg1out_Dst_Muxin),
				.RD_out(RD_Reg1out_Dst_Muxin), .ALU_OP_out(ALUOPReg1out_ALUSin),
				.WB_out(WB_Reg1out_Reg2in), .ALU_Reg_out(ALU_Reg1out_ALU_Muxin), .Dst_Reg_out(Dst_Reg1out_Dst_Muxin), 
				.Mem_Reg_out(MemReg_Reg1in_Reg2out), .Sign_out(Sing_Reg1out_Immediatein),
				.MemRd_out(MemRd_Reg1out), .MemWr_out(MemWr_Reg1out_DMin),.jr_Reg_out(jr_Reg1out_Reg2in),
				.y(output_Reg1));
				
				
DataMemory DataMemory1 (.address(RT_Reg1out_Dst_Muxin),
								.clock(clk),
								.data(A_Reg1out_Aluin), .rden(MemRd_Reg1out),
								.wren(MemWr_Reg1out_DMin),
								.q(Data_DMout_Reg2in));
							 
REG2 REG2_1(.DMR(Data_DMout_Reg2in),
            .ALU(ALUout_Reg2in), .PC(PCReg1Out_PCReg2in),
				.RSRT(DstRegout_Reg2in),
				.WB(WB_Reg1out_Reg2in),
				.Mem_Reg(MemReg_Reg1in_Reg2out),
				.clk(clk),
				.jr_Reg(jr_Reg1out_Reg2in),
				.DMR_out(DMR_Reg2out_MemMuxin),
				.ALU_out(ALU_Reg2out_MemMuxin),
				.PC_out(PC_Reg2out_JrMuxin),
				.RSRT_out(RSRT_Reg2out_RFin),
				.WB_out(WB_Reg2out_RFin),
				.Mem_Reg_out(MemReg_Reg2out_MemMuxin),
				.jr_Reg_out(Jr_Reg2in_JrMuxin),
				.y(output_Reg2));
				
//For data input in the DM
Immediate_Sign_Extention Immediate_Sign_Extention1(.immediate(Immediate_Reg1out_SEin), // the 5 bit adress is sign extended
																	.sign(Sing_Reg1out_Immediatein), // sign is controlled by the CU 
																	.y(SEout_ALUmuxin));
//Complete					
ALU 			ALU1(.a(A_Reg1out_Aluin), 
						.b(ALU_Muxout_ALUin),
						.s(ALUOPReg1out_ALUSin),
						.y(ALUout_Reg2in) );
			
//Forwarding 		
ForwardDetectionUnit ForwardDetectionUnit1(.RS1(IR_out[10:8]), .RT1(IR_out[7:5]),
														.RT2(RT_Reg1out_Dst_Muxin),
														.RD2(RD_Reg1out_Dst_Muxin), .RTRD(RSRT_Reg2out_RFin),
														.MemRd(MemRd_Reg1out), .MemWr(MemWr_Reg1out_DMin), .WB3(WB_Reg2out_RFin),
														.FU_1(FU1out_ForwardingMux1in), .FU_2(FU2out_ForwardingMux2in));

				

				
Mux_16_2_to_1	Dst_Mux(.a(RT_Reg1out_Dst_Muxin), .b(RD_Reg1out_Dst_Muxin),
			   				   .s(Dst_Reg1out_Dst_Muxin),
								   .y(DstRegout_Reg2in));
				

Mux_8				Alu_Mux(.a(B_Reg1out_ALUMuxin), .b(SEout_ALUmuxin),
					  .s(ALU_Reg1out_ALU_Muxin),
				     .y(ALU_Muxout_ALUin));
		   
		
Mux_8   		   Mem_Mux(.a(ALU_Reg2out_MemMuxin), .b(DMR_Reg2out_MemMuxin),
					  .s(MemReg_Reg2out_MemMuxin),
				     .y(MemMuxout_JrMuxin));
					  
					  
Mux_8          Jr_Mux(.a(MemMuxout_JrMuxin),
					.b(PC_Reg2out_JrMuxin),
				   .s(Jr_Reg2in_JrMuxin),
				   .y(JrMuxout_RFinDW));
					
					
Mux_16_4_to_1 Forwarding1(.a(RFout_ForwardingMux1in),.b(ALUout_Reg2in),.c(Data_DMout_Reg2in),.d(JrMuxout_RFinDW),
								  .s(FU1out_ForwardingMux1in),
								  .y(A_Forwaring1Muxout_Reg1in));

Mux_16_4_to_1 Forwarding2(.a(RFout_ForwardingMux2in),.b(ALUout_Reg2in),.c(Data_DMout_Reg2in),.d(JrMuxout_RFinDW),
								  .s(FU2out_ForwardingMux2in),
								  .y(B_Forwaring2Muxout_Reg2in));
						 
						 
endmodule 