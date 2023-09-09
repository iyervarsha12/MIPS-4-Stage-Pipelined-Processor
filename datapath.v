module datapath(input clock,reset);
  wire [7:0] Instruction_Code;
  wire [7:0] IF_ID_inst_code_out;
  wire [2:0] write_reg_num;
  wire [7:0] WB_mux_out;
  wire [7:0] ID_EX_Rddata_in;
  wire writeRegWB_path,regWrite;
  wire [7:0] ID_EX_Rddata_out;
  wire [2:0] ID_EX_Rs_out,ID_EX_Rd_out;
  wire ID_EX_regWrite_out;
  wire ctrl;
  wire [7:0] ALU_out;
  wire [2:0] EX_WB_Rd_in;
  wire EX_WB_regWrite_in;
  wire [2:0] EX_WB_Rd_out;
  wire EX_WB_regWrite_out;
  wire [7:0] ALU_WB_out;
  wire ALUsrc;
  wire ID_EX_ALUsrc;

  IF_jump_module X1(clock,reset,Instruction_Code); //entire of IF module.
  IF_ID X2(clock,reset,Instruction_Code,IF_ID_inst_code_out);  //IF/ID pipeline
  
  Register_file X3(IF_ID_inst_code_out[2:0],IF_ID_inst_code_out[5:3],write_reg_num, 
  WB_mux_out,writeRegWB_path,reset,ID_EX_Rddata_in); //Register file module
 
  ID_EX X4(clock,reset,ID_EX_Rddata_in,IF_ID_inst_code_out[2:0],IF_ID_inst_code_out[5:3],
  regWrite,ALUsrc ,ID_EX_Rddata_out,ID_EX_Rs_out,ID_EX_Rd_out,ID_EX_regWrite_out, ID_EX_ALUsrc); 
  
  ALU X5(ID_EX_Rddata_out,ID_EX_Rs_out,ID_EX_Rd_out,ID_EX_regWrite_out,
  ctrl,WB_mux_out,ID_EX_ALUsrc,ALU_out,EX_WB_Rd_in,EX_WB_regWrite_in);
  
  forward_unit X6(ID_EX_Rd_out,EX_WB_Rd_out,EX_WB_regWrite_out,ctrl); 
  control_unit X7(IF_ID_inst_code_out[7:6],regWrite,ALUsrc); 
  //Control signals produced are regWrite and ALUsrc. Jump_control is done in jump module itself.
  
  EX_WB X8(clock,reset,ALU_out,EX_WB_Rd_in,EX_WB_regWrite_in,
  ALU_WB_out,EX_WB_Rd_out,EX_WB_regWrite_out);
 
  WB_path X9(ALU_WB_out,EX_WB_Rd_out,EX_WB_regWrite_out,
  WB_mux_out,writeRegWB_path,write_reg_num);
endmodule
  
  
  