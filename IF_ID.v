module IF_ID(input clock, 
	input reset,
	input [7:0] IF_ID_inst_code_in,
	output reg [7:0] IF_ID_inst_code_out);
  
  always@(posedge clock or negedge reset)
  begin
		if(reset == 0  )
			begin
			IF_ID_inst_code_out <= 8'b0;
			end   
		else
			begin 
			IF_ID_inst_code_out <= IF_ID_inst_code_in;
			end
  end
endmodule
  