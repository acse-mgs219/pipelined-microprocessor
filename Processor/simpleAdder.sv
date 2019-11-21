module simpleAdder(input logic [7:0] A,
                   input clk,
                   output logic [7:0] PCplus1);
						 
always_ff @ (posedge clk)
begin
PCplus1 <= A + 8'b01;
end

endmodule