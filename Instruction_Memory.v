module Instruction_Memory(
  input [7:0] pc,
  input reset,
  output [7:0] Instruction_Code);

reg [7:0] Mem[0:27];

assign Instruction_Code = {Mem[pc]};

always@(reset)
	begin
	if(reset==0)
		begin
		Mem[0]=8'h13;
		Mem[1]=8'h51;
		Mem[2]=8'h1C;
		Mem[3]=8'hC5;
		Mem[4]=8'h5B;
		Mem[5]=8'h2A;
		end
	end
endmodule