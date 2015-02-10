module Init_Fetch(clk, reset, stall, addrInst, instIn, instOut);
  parameter dataWidth = 128, addrWidth = 7, instWidth = 32;
  
  input clk, reset, stall;
  input [dataWidth - 1: 0] instIn;
  output logic [addrWidth - 1: 0] addrInst;
  output logic [instWidth * 2 - 1: 0] instOut;
  
  logic [5: 0] instInCounter, instOutCounter;
  logic [instWidth - 1: 0] ILB[17: 0];
  logic full;
  
  always_ff @(posedge clk) // initiation
  begin
    if(reset == 1)
      begin
        instInCounter <= 0;
        instOutCounter <= 16;
        addrInst <= 0;
        full <= 0;
        //ILB[0] <= 32'hFFFFFFFF; 
        //ILB[1] <= 32'hFFFFFFFF;
        ILB[16] <= 32'hFFFFFFFF;
        ILB[17] <= 32'hFFFFFFFF; // inst unavailible
      end
    else
      begin
        if(full == 0)
          begin
            ILB[0 + instInCounter] <= instIn[instWidth - 1: 0];
            ILB[1 + instInCounter] <= instIn[instWidth * 2 - 1: instWidth];
            ILB[2 + instInCounter] <= instIn[instWidth * 3 - 1: instWidth * 2];
            ILB[3 + instInCounter] <= instIn[instWidth * 4 - 1: instWidth * 3];
            addrInst <= addrInst + 1;
            instInCounter <= instInCounter + 4;
            if(instInCounter ==12) // inst mem full
              begin
                full <= 1;
                instInCounter <= 0;
                instOutCounter <= 0;
              end
          end
      end
  end
  
  always_ff @(posedge clk) // fetch
  begin
    if(full == 1 && stall == 0)
      begin
        instOutCounter <= instOutCounter + 2;
        if(instOutCounter == 14) // inst mem empty
          begin
            full <= 0;
          end
      end
  end
  
  assign instOut[instWidth - 1: 0] = ILB[instOutCounter + 0];
  assign instOut[instWidth * 2 - 1: instWidth] = ILB[instOutCounter + 1];
  
endmodule
        
  
