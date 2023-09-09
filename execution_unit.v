module ALU(input [7:0] EX_ID_Rddata_out,
  input [2:0] EX_ID_Rs_out,
  input [2:0] EX_ID_Rd_out,
  input EX_ID_regWrite_out,
  input ctrl,
  input [7:0] WB_mux_out,
  input EX_ID_ALUsrc,
  output reg [7:0] ALU_out,
  output [2:0] EX_WB_Rd_in,
  output EX_WB_regWrite_in
   );
   
   wire [7:0] Rddata_alu;
   reg [7:0] temp; 
   assign EX_WB_Rd_in = EX_ID_Rd_out;
   
   assign {EX_WB_regWrite_in} = {EX_ID_regWrite_out};
   
   assign Rddata_alu = (ctrl) ? WB_mux_out : EX_ID_Rddata_out;
   
   always @(*)
	begin
	if(EX_ID_ALUsrc==0) //add
		begin
		temp = {{5{EX_ID_Rs_out[2]}},EX_ID_Rs_out[2:0]};
		ALU_out = temp + Rddata_alu;
		end
	
	else if(EX_ID_ALUsrc==1) //slli
		begin
		ALU_out = Rddata_alu << EX_ID_Rs_out;
		end
		//else jump. Do nothing.
   	end
   
 endmodule
   