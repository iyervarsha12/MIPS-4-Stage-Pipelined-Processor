module forward_unit(input [2:0] ID_EX_Rd_out,
					input [2:0] EX_WB_Rd_out,
					input EX_WB_regWrite,
					output reg ctrl);
  always@(EX_WB_regWrite,EX_WB_Rd_out,ID_EX_Rd_out)
  begin
    if ( EX_WB_regWrite==1)
      begin
        ctrl = (EX_WB_Rd_out == ID_EX_Rd_out) ? 1 : 0;
      end
    else
      ctrl = 0;
  end
endmodule
        