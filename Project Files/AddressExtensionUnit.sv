module AddressExtensionUnit(input [7:0] InstAddress,
								 output [7:0] ByteAddress);
										  

always_comb
begin
ByteAddress = {InstAddress[4:0], 3'b000};
end

endmodule