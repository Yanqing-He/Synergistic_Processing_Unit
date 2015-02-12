module ZeroExt(immeNum, dataOut);
  parameter dataWidth = 128, immeWidth = 10;
  
  input [immeWidth - 1: 0] immeNum;
  output logic [dataWidth - 1: 0] dataOut;
  
  assign dataOut[immeWidth - 1: 0] = immeNum;
  assign dataOut[dataWidth - 1: immeWidth] = 0;
  
endmodule