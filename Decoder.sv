module Decoder(clk, reset, stallIn, instIn, stallOut, instOut);
  parameter instWidth = 32;
  
  input clk, stallIn;
  input [instWidth * 2 - 1: 0] instIn;
  output stallOut;
  output [instWidth * 2 - 1: 0] instOut;
  
  logic [instWidth: 0] inst0, inst1;
  
  always_ff @(posedge clk)
  begin
    if(reset)
      begin
        instOut <= 64'hFFFFFFFFFFFFFFFF; // decode currently unavailible
        inst0 <= 
      end
    else
      begin
        
