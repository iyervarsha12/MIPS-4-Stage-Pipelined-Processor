module IF_jump_module(input clk, 
	input reset,
	output [7:0] Instruction_Code
  );
reg [7:0] pc;
reg [7:0] pc_next;
reg jump_control;

Instruction_Memory IM_X(pc,reset,Instruction_Code);

always @(posedge clk,negedge reset)
begin
case(Instruction_Code[7:6])
	2'b00: jump_control=0; //addi
	2'b01: jump_control=0;//sll
	2'b11: jump_control=1;//jump
endcase
if(reset ==0)
	begin
    pc =0;
    pc_next = pc +1;
	end
else
	begin
	pc = (jump_control)?  {pc_next[7:6], Instruction_Code[5:0] }: pc_next;
	pc_next = pc +1;
	end
end
  
endmodule