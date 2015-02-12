module ZeroExt_tb();
  logic [3: 0] immeNum;
  logic [9: 0] dataOut;
  
  ZeroExt #(.dataWidth(10), .immeWidth(4)) ins1(
  .immeNum(immeNum),
  .dataOut(dataOut)
  );
  
  
  initial
  begin
    immeNum = 0;
  end
  
  always
  begin
    #2 immeNum = $random % 4'b1111;
  end
  
endmodule