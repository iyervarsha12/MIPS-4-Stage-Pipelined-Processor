module Register_file(input [2:0] Read_Reg_Num_1,
					input [2:0] Read_Reg_Num_2,
					input [2:0] Write_Reg_Num,
					input [7:0] Write_Data,
					input RegWrite,
					input reset,
					output  [7:0] Read_Data_2);
  
  reg  [7:0] RegMemory[0:7];
  assign  Read_Data_2=RegMemory[Read_Reg_Num_2];
  
  always@(RegWrite,Write_Data,Write_Reg_Num)
	begin
    if(RegWrite==1)
      RegMemory[Write_Reg_Num]<=Write_Data;
	end
      
  always@(negedge reset)
	begin
	/*
	RegMemory[0]=0;
	RegMemory[1]=1;
	RegMemory[2]=2;
	RegMemory[3]=3;
	RegMemory[4]=4;
	RegMemory[5]=5;
	RegMemory[6]=6;
	RegMemory[7]=7;
	*/
	$readmemh("register.mem",RegMemory);
	end   
endmodule
        