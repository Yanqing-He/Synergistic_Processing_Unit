module ALU(clk_fake, opCode, inA, inB, dataOut, zeroOut);
  parameter dataWidth = 128;
  
  input clk_fake;
  input [3: 0] opCode;
  input [dataWidth - 1: 0] inA, inB;
  output logic [dataWidth - 1: 0] dataOut;
  output logic[3:0] zeroOut;
  
  logic [1: 0] counter;
  logic [dataWidth - 1: 0] dataOutReg1, dataOutReg2;
  
  always_ff @(negedge clk_fake)
  begin
    if(opCode == 4'b0000) // +
      begin
        dataOut <= inA + inB;
      end
    else if(opCode == 4'b0001) // -
      begin
        dataOut <= inA - inB;
      end
    else if(opCode == 4'b0010) // x, 2 cycles
      begin
        dataOutReg1 <= inA * inB;
        dataOut <= dataOutReg1;
      end
    else if(opCode == 4'b0011) // or
      begin
        dataOut <= inA & inB;
      end
    else if(opCode == 4'b0100) // and
      begin
        dataOut <= inA | inB;
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