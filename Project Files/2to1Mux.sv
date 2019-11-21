module Twoto1Mux(input logic a[2:0],
               input logic b[2:0],
	       input logic sel,
	       output logic out[2:0]);
						 
always_comb
if (sel)
 out = b;
else 
 out = a;
	
endmodule