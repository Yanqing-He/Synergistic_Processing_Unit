module ALU_tb();
  logic clk_fake;
  logic [3: 0] opCode;
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
    inA = 0;
    inB = 0;
  end
  
  always
  begin
    #4 clk_fake = ~clk_fake;
  end
  
  initial
  begin
    #5 opCode = 4'b0000;
    inA = 12;
    inB = 10;
    #8 opCode = 4'b0001;
    #8 opCode = 4'b0010;
    #16 opCode = 4'b0001;
  end
endmodule
