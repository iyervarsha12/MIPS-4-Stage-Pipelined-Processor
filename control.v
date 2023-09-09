module control_unit(input [1:0] opcode,
				output reg regWrite,
				output reg ALUsrc);
//alusrc = 1 for sll, 0 for addi
  always@(opcode)
  begin
    case(opcode)
	   2'b00: {regWrite,ALUsrc} = 4'b10; //addi
      2'b01: {regWrite,ALUsrc} = 4'b11; //sll
	2'b11: {regWrite,ALUsrc} = 4'b0x; //j
    endcase
  end
endmodule
  