module Decoder_tb();
  localparam addrWidth = 7, instWidth = 32;
  
  logic clk, reset, stallIn;
  logic [instWidth * 2 - 1: 0] instIn;
  logic stallOut;
  
  logic [5: 0] opOutEven;
  logic [addrWidth - 1: 0] raEven, rbEven, rdEven;
  logic [9: 0] immeNumEven;
  logic immeSelEven;
  logic [instWidth - 1: 0] inst0, inst1, tempInst;
  
  Decoder ins1(
  .clk(clk),
  .reset(reset),
  .stallIn(stallIn),
  .instIn(instIn),
  .stallOut(stallOut),
  .inst0(inst0),
  .inst1(inst1),
  .tempInst(tempInst),
  .opOutEven(opOutEven),
  .raEven(raEven),
  .rbEven(rbEven),
  .rdEven(rdEven),
  .immeNumEven(immeNumEven),
  .immeSelEven(immeSelEven)
  );
  
  initial
  begin
    reset = 1;
    clk = 0;
    stallIn = 0;
    
    instIn = 64'h0411111110222222;
    
    #10 reset = 0;
  end
  
  always
  begin
    #4 clk = ~clk;
  end
  
  initial
  begin
    #24 instIn = 64'h0811111118222222;
  end
  
endmodule