module Init_Fetch_tb();
  logic clk, reset, stall;
  logic [15: 0] instIn;
  logic [6: 0] addrInst;
  logic [7: 0] instOut;
  
  Init_Fetch #(.dataWidth(16), .addrWidth(7), .instWidth(4)) ins1(
  .clk(clk),
  .reset(reset),
  .stall(stall),
  .addrInst(addrInst),
  .instIn(instIn),
  .instOut(instOut)
  );
  
  logic [3: 0] i;
  
  initial
  begin
    clk = 0;
    reset = 1;
    stall = 0;
    instIn = $random % 16'hFFFF;
  end
  
  always
  begin
    #4 clk = ~clk;
  end
  
  initial
  begin
    #13 reset = 0;
    instIn = $random % 16'hFFFF;
    for(i = 0; i < 4; i = i + 1)
    begin
      #8 instIn = $random % 16'hFFFF;
    end
  end
  
  initial
  begin
    #61 stall = 1;
    #16 stall = 0;
  end

endmodule