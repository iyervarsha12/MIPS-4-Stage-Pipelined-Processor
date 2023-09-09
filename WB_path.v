module WB_path(input [7:0] ALU_WB_out,
  input [2:0] EX_WB_Rd_out,
  input EX_WB_regWrite_out,
  output [7:0] WB_mux_out,
  output writeRegWB_path,
  output [2:0] write_reg_num);
 
  assign WB_mux_out =  ALU_WB_out;
  
  assign writeRegWB_path = EX_WB_regWrite_out;
  
  assign write_reg_num = EX_WB_Rd_out;
  
endmodule