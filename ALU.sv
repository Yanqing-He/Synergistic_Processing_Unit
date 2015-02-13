module ALU(clk_fake, opCode, inA, inB, dataOut, zeroOut);
  parameter dataWidth = 128;
  localparam wordWidth = dataWidth / 4, hwordWidth = wordWidth / 2, dwordWidth = wordWidth * 2;
  
  input clk_fake;
  input [5: 0] opCode;
  input [dataWidth - 1: 0] inA, inB;
  output logic [dataWidth - 1: 0] dataOut;
  output logic[3:0] zeroOut;
  
  logic [1: 0] counter;
  logic [dataWidth - 1: 0] dataOutReg1, dataOutReg2;
  
  always_ff @(negedge clk_fake)
  begin
    if(opCode == 6'd4) // add halfword
      begin
        dataOut[hwordWidth - 1: 0] <= 
                inB[hwordWidth- 1: 0] + inA[hwordWidth - 1: 0];
        dataOut[hwordWidth * 2 - 1: hwordWidth] <= 
                inB[hwordWidth * 2 - 1: hwordWidth] + inA[hwordWidth * 2 - 1: hwordWidth];
        dataOut[hwordWidth * 3 - 1: hwordWidth *  2] <= 
                inB[hwordWidth * 3 - 1: hwordWidth *  2] + inA[hwordWidth * 3 - 1: hwordWidth *  2];
        dataOut[hwordWidth * 4 - 1: hwordWidth *  3] <= 
                inB[hwordWidth * 4 - 1: hwordWidth *  3] + inA[hwordWidth * 4 - 1: hwordWidth *  3];
        dataOut[hwordWidth * 5 - 1: hwordWidth *  4] <= 
                inB[hwordWidth * 5 - 1: hwordWidth *  4] + inA[hwordWidth * 5 - 1: hwordWidth *  4];
        dataOut[hwordWidth * 6 - 1: hwordWidth *  5] <= 
                inB[hwordWidth * 6 - 1: hwordWidth *  5] + inA[hwordWidth * 6 - 1: hwordWidth *  5];
        dataOut[hwordWidth * 7 - 1: hwordWidth *  6] <= 
                inB[hwordWidth * 7 - 1: hwordWidth *  6] + inA[hwordWidth * 7 - 1: hwordWidth *  6];
        dataOut[hwordWidth * 8 - 1: hwordWidth *  7] <= 
                inB[hwordWidth * 8 - 1: hwordWidth *  7] + inA[hwordWidth * 8 - 1: hwordWidth *  7];
      end
    else if(opCode == 6'd6) // add halfword immediate
      begin
        dataOut[hwordWidth - 1: 0] <= 
                inB[hwordWidth- 1: 0] + inA[hwordWidth - 1: 0];
        dataOut[hwordWidth * 2 - 1: hwordWidth] <= 
                inB[hwordWidth- 1: 0] + inA[hwordWidth * 2 - 1: hwordWidth];
        dataOut[hwordWidth * 3 - 1: hwordWidth *  2] <= 
                inB[hwordWidth- 1: 0] + inA[hwordWidth * 3 - 1: hwordWidth *  2];
        dataOut[hwordWidth * 4 - 1: hwordWidth *  3] <= 
                inB[hwordWidth- 1: 0] + inA[hwordWidth * 4 - 1: hwordWidth *  3];
        dataOut[hwordWidth * 5 - 1: hwordWidth *  4] <= 
                inB[hwordWidth- 1: 0] + inA[hwordWidth * 5 - 1: hwordWidth *  4];
        dataOut[hwordWidth * 6 - 1: hwordWidth *  5] <= 
                inB[hwordWidth- 1: 0] + inA[hwordWidth * 6 - 1: hwordWidth *  5];
        dataOut[hwordWidth * 7 - 1: hwordWidth *  6] <= 
                inB[hwordWidth- 1: 0] + inA[hwordWidth * 7 - 1: hwordWidth *  6];
        dataOut[hwordWidth * 8 - 1: hwordWidth *  7] <= 
                inB[hwordWidth- 1: 0] + inA[hwordWidth * 8 - 1: hwordWidth *  7];
      end
    else if(opCode == 6'd12) // -
      begin
        dataOut[hwordWidth - 1: 0] <= 
                inB[hwordWidth- 1: 0] - inA[hwordWidth - 1: 0];
        dataOut[hwordWidth * 2 - 1: hwordWidth] <= 
                inB[hwordWidth * 2 - 1: hwordWidth] - inA[hwordWidth * 2 - 1: hwordWidth];
        dataOut[hwordWidth * 3 - 1: hwordWidth *  2] <= 
                inB[hwordWidth * 3 - 1: hwordWidth *  2] - inA[hwordWidth * 3 - 1: hwordWidth *  2];
        dataOut[hwordWidth * 4 - 1: hwordWidth *  3] <= 
                inB[hwordWidth * 4 - 1: hwordWidth *  3] - inA[hwordWidth * 4 - 1: hwordWidth *  3];
        dataOut[hwordWidth * 5 - 1: hwordWidth *  4] <= 
                inB[hwordWidth * 5 - 1: hwordWidth *  4] - inA[hwordWidth * 5 - 1: hwordWidth *  4];
        dataOut[hwordWidth * 6 - 1: hwordWidth *  5] <= 
                inB[hwordWidth * 6 - 1: hwordWidth *  5] - inA[hwordWidth * 6 - 1: hwordWidth *  5];
        dataOut[hwordWidth * 7 - 1: hwordWidth *  6] <= 
                inB[hwordWidth * 7 - 1: hwordWidth *  6] - inA[hwordWidth * 7 - 1: hwordWidth *  6];
        dataOut[hwordWidth * 8 - 1: hwordWidth *  7] <= 
                inB[hwordWidth * 8 - 1: hwordWidth *  7] - inA[hwordWidth * 8 - 1: hwordWidth *  7];
      end
    else if(opCode == 6'd20) // x, 2 cycles
      begin
        dataOutReg1[wordWidth - 1: 0] <= 
                inB[hwordWidth- 1: 0] * inA[hwordWidth - 1: 0];
        dataOutReg1[wordWidth * 2 - 1: wordWidth] <= 
                inB[hwordWidth * 3 - 1: hwordWidth *  2] * inA[hwordWidth * 3 - 1: hwordWidth *  2];
        dataOutReg1[wordWidth * 3 - 1: wordWidth *  2] <= 
                inB[hwordWidth * 5 - 1: hwordWidth *  4] * inA[hwordWidth * 5 - 1: hwordWidth *  4];
        dataOutReg1[wordWidth * 4 - 1: wordWidth *  3] <= 
                inB[hwordWidth * 7 - 1: hwordWidth *  6] * inA[hwordWidth * 7 - 1: hwordWidth *  6];
        dataOut <= dataOutReg1;
      end
    else if(opCode == 6'd28) // and
      begin
        dataOut <= inA | inB;
      end
    else if(opCode == 6'd30) // or
      begin
        dataOut <= inA & inB;
      end
    else if(opCode == 4'b0101) // float +, 3 cycles
      begin
      end
    else if(opCode == 4'b0110) // float x, 3 cycles
      begin
      end
    else if(opCode == 4'b0111) // shift, 2 cycles
      begin
      end
    else if(opCode == 4'b1000) // rotate, 2 cycles
      begin
      end
    else // idle
      begin
        dataOut <= 'bz;
        zeroOut <= 4'bz;
      end
  end
  
endmodule