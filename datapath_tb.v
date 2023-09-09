module datapath_tb;
  reg clock;
  reg reset;
  datapath A1(clock,reset);
  
  initial
  begin
    #5 reset = 0;
    #15 reset =1;
   #135 reset =0;
   #10 reset =1;
  end
  
  initial
  begin
    clock =1;
    repeat(20)
    #10 clock = ~clock;
  end
endmodule    