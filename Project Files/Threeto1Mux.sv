module Threeto1Mux(input logic [7:0] a,
                   input logic [7:0] b,
					    input logic [7:0] c,
	                input logic [1:0] sel,
	                output logic [7:0] out);
						 
always_comb
begin
if (sel == 2'b00)
 out = a;
else if (sel == 2'b01)
 out = b;
else if (sel == 2'b10)
 out = c;
else
 out = 0;
end
	
endmodule