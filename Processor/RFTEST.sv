module RFTEST(clk,rst,write,user,r1_addr,r2_addr,user_addr1,user_addr2,wr_addr,wr_data,r1_data,r2_data);

   

input clk;

input rst;

input write, user;

input [2:0] r1_addr, user_addr1;

input [2:0] r2_addr, user_addr2;

input [2:0] wr_addr;

input [7:0] wr_data;

output reg[7:0] r1_data;

output reg[7:0] r2_data;

integer i;

reg [7:0]out_reg [7:0];

    

always_ff@(posedge clk)

begin

 

    if(rst)

    begin

        for (i=0; i < 7; i = i + 1)  // Setting individual memory cells to 0

        out_reg[i] <= 0;

        end

   

    else if(write)

            begin

 

                out_reg[wr_addr]<= wr_data;

               

            end

end

 

always_comb

begin

if(user)

begin

r1_data = out_reg[user_addr1];

r2_data = out_reg[user_addr1];

end

else

begin

r1_data = out_reg[r1_addr];

r2_data = out_reg[r2_addr];

end

end

 

endmodule