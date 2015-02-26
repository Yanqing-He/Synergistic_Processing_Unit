module IntermediateReg(clk, immeSelIn, opCodeIn, raIn, rbIn, rdIn, immeSelOut, opCodeOut, raOut, rbOut, rdOut);
  
  input clk, immeSelIn;
  input [5: 0] opCodeIn;
  input [6: 0] raIn, rbIn, rdIn;
  
  output logic immeSelOut;
  output logic [5: 0] opCodeOut;
  output logic [6: 0] raOut, rbOut, rdOut;
  
  always_ff @(posedge clk)
  begin
    immeSelOut <= immeSelIn;
    opCodeOut <= opCodeIn;
    raOut <= raIn;
    rbOut <= rbIn;
    rdOut <= rdIn;  
  end
  
endmodule
