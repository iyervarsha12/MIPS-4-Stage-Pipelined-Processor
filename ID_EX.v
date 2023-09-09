module ID_EX(input clock,
			input reset,
			input [7:0] EX_ID_Rddata_in,
			input [2:0] EX_ID_Rs_in,
			input [2:0] EX_ID_Rd_in,
			input regWrite,
			input ALUsrc,
			output reg [7:0]EX_ID_Rddata_out,
			output reg [2:0] EX_ID_Rs_out,
			output reg [2:0] EX_ID_Rd_out,
			output reg EX_ID_regWrite_out,
			output reg EX_ID_ALUsrc);

  always@(negedge reset, posedge clock)
  begin
    if(reset == 0)
      begin
        {EX_ID_Rddata_out,EX_ID_Rs_out,EX_ID_Rd_out} <= 14'b0;
        {EX_ID_regWrite_out} <=1'b0;
      end
    else
      begin
        {EX_ID_Rddata_out,EX_ID_Rs_out,EX_ID_Rd_out} <={EX_ID_Rddata_in,EX_ID_Rs_in,EX_ID_Rd_in};
        {EX_ID_regWrite_out} <= {regWrite};
		EX_ID_ALUsrc=ALUsrc;
      end
    
  end
endmodule
  
  