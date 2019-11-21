module twoToOne7bit(input logic a[7:0],
               input logic b[7:0],
	       input logic sel,
	       output logic out[7:0]);
						 
always_comb
if (sel)
 out = b;
else 
 out = a;
	
endmodule