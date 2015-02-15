module ALU_tb();
  logic clk_fake;
  logic [5: 0] opCode;
  logic [7: 0] inA, inB;
  logic [7: 0] dataOut;
  
  ALU #(.dataWidth(8)) alu1(
  .clk_fake(clk_fake),
  .opCode(opCode),
  .inA(inA),
  .inB(inB),
  .dataOut(dataOut)
  );
  
  initial
  begin
    clk_fake = 0;
    opCode = 0;
    inA = 8'd0;
    inB = 8'd0;
  end
  
  always
  begin
    #4 clk_fake = ~clk_fake;
  end
  
  initial
  begin
    #4 opCode = 6'd63;
    inA = 8'd12;
    inB = 8'd10;
    #8 opCode = 6'd4;
    #8 opCode = 6'd20;
    #16 opCode = 6'd4;
  end
endmodule
