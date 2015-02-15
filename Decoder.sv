module Decoder(clk, reset, stallIn, instIn, stallOut, inst0, inst1, tempInst,
opOutEven, raEven, rbEven, rdEven, immeNumEven, immeSelEven,
opOutOdd, raOdd, rbOdd, rdOdd, immeNumOdd);

  parameter addrWidth = 7, instWidth = 32;
  
  input clk, reset, stallIn;
  input [instWidth * 2 - 1: 0] instIn;
  output logic stallOut;
  //output logic [instWidth * 2 - 1: 0] instOut;
  
  output logic [5: 0] opOutEven;
  output logic [addrWidth - 1: 0] raEven, rbEven, rdEven;
  output logic [9: 0] immeNumEven;
  output logic immeSelEven;
  
  output logic [5: 0] opOutOdd;
  output logic [addrWidth - 1: 0] raOdd, rbOdd, rdOdd;
  output logic [9: 0] immeNumOdd;
  
  output logic [instWidth - 1: 0] inst0, inst1, tempInst;
  logic stall;
  logic [2: 0] stallCounter;
  
  always_ff @(posedge clk) // decode, structual hazard detection
  begin
    if(reset)
      begin
        //instOut <= 64'hFFFFFFFFFFFFFFFF; // decode currently unavailible
        inst0 <= 32'hFFFFFFFF;
        inst1 <= 32'hFFFFFFFF;
        tempInst <= 32'hFFFFFFFF;
        stall <= 0;
      end
    else
      begin
        if(~stall)
          begin
            if(tempInst == 32'hFFFFFFFF) // no inst from previous cycle left
              begin
                if(0) // structual hazard detected
                  begin
            
                  end
                else if((instIn[63: 58] % 2 == 0 && instIn[31: 26] % 2 == 0) || 
                (instIn[63: 58] % 2 == 1 && instIn[31: 26] % 2 == 1)) // 2 even inst or 2 odd inst
                  begin
                    inst0 <= instIn[instWidth - 1: 0];
                    inst1 <= 32'hFFFFFFFF;
                    tempInst <= instIn[instWidth * 2 - 1: instWidth];
                    stallOut <= 1;
                  end
                else // no hazard
                  begin
                    inst0 <= instIn[instWidth - 1: 0];
                    inst1 <= instIn[instWidth * 2 - 1: instWidth];
                  end
              end
            else // inst from previous cyvle
              begin
                inst0 <= tempInst;
                inst1 <= 32'hFFFFFFFF;
                tempInst <= 32'hFFFFFFFF;
                stallOut <= 0;
              end
          end
      end
  end
  
  always_ff @(posedge clk) // issue, ouput control signals
  begin
    if(stall) // pause
      begin
        if(stallCounter > 1)
          begin
            stallCounter <= stallCounter - 1;
          end
        else if(stallCounter == 1)
          begin
            stallCounter <= stallCounter - 1;
            stall <= 0;
          end
      end
    else // normal condition
      begin // analyze op code
        // even pipe
        if(inst0[31: 26] == 6'd0)
          begin
          end
        if(inst0[31: 26] == 6'd2)
          begin
          end
        if(inst0[31: 26] == 6'd4) // add half word
          begin
            opOutEven <= 6'd4;
            rdEven <= inst0[6: 0];
            raEven <= inst0[13: 7];
            rbEven <= inst0[21: 8];
            immeNumEven <= 0;
            immeSelEven <= 0;
          end
        if(inst0[31: 26] == 6'd6) // add half word immediate
          begin
            opOutEven <= 6'd6;
            rdEven <= inst0[6: 0];
            raEven <= inst0[13: 7];
            immeNumEven <= inst0[23: 14];
            immeSelEven <= 1;
          end
        if(inst0[31: 26] == 6'd8) // add word
          begin
            opOutEven <= 6'd8;
            rdEven <= inst0[6: 0];
            raEven <= inst0[13: 7];
            rbEven <= inst0[21: 8];
            immeNumEven <= 0;
            immeSelEven <= 0;
          end
        if(inst0[31: 26] == 6'd10) // add word immediate
          begin
            opOutEven <= 6'd10;
            rdEven <= inst0[6: 0];
            raEven <= inst0[13: 7];
            immeNumEven <= inst0[23: 14];
          end
        if(inst0[31: 26] == 6'd12)
          begin
          end
        if(inst0[31: 26] == 6'd14)
          begin
          end
        if(inst0[31: 26] == 6'd16)
          begin
          end
        if(inst0[31: 26] == 6'd18)
          begin
          end    
        if(inst0[31: 26] == 6'd20) // multiply word
          begin
            opOutEven <= 6'd20;
            rdEven <= inst0[6: 0];
            raEven <= inst0[13: 7];
            rbEven <= inst0[21: 8];
            immeNumEven <= 0;
            immeSelEven <= 0;
            stallCounter <= 1; // stall one cycle for multiplying
            stall <= 1;
          end    
        if(inst0[31: 26] == 6'd22)
          begin
          end    
        if(inst0[31: 26] == 6'd24)
          begin
          end        
        if(inst0[31: 26] == 6'd26)
          begin
          end
        if(inst0[31: 26] == 6'd28)
          begin
          end
        if(inst0[31: 26] == 6'd30)
          begin
          end
        if(inst0[31: 26] == 6'd32)
          begin
          end
        if(inst0[31: 26] == 6'd34)
          begin
          end
        if(inst0[31: 26] == 6'd36)
          begin
          end
        if(inst0[31: 26] == 6'd38)
          begin
          end
        if(inst0[31: 26] == 6'd40)
          begin
          end
        if(inst0[31: 26] == 6'd42)
          begin
          end
        if(inst0[31: 26] == 6'd44)
          begin
          end
        if(inst0[31: 26] == 6'd46)
          begin
          end
        if(inst0[31: 26] == 6'd48)
          begin
          end
        if(inst0[31: 26] == 6'd50)
          begin
          end
        // odd pipe
        if(inst0[31: 26] == 6'd1)
          begin
          end
        if(inst0[31: 26] == 6'd3)
          begin
          end
        if(inst0[31: 26] == 6'd5)
          begin
          end
        if(inst0[31: 26] == 6'd7)
          begin
          end
        if(inst0[31: 26] == 6'd9)
          begin
          end
        if(inst0[31: 26] == 6'd11)
          begin
          end
        if(inst0[31: 26] == 6'd13)
          begin
          end
        if(inst0[31: 26] == 6'd15)
          begin
          end
        if(inst0[31: 26] == 6'd17)
          begin
          end
        if(inst0[31: 26] == 6'd19)
          begin
          end
        if(inst0[31: 26] == 6'd21)
          begin
          end
        if(inst0[31: 26] == 6'd23)
          begin
          end
        if(inst0[31: 26] == 6'd25)
          begin
          end
        if(inst0[31: 26] == 6'd27)
          begin
          end
        if(inst0[31: 26] == 6'd29)
          begin
          end
                  
      end
    
  end
  
  always_ff @(posedge clk) // even pipe data hazard and forward
  begin
    
  end
  
  always_ff @(posedge clk) // odd pipe data hazard and forwad
  begin
    
  end
endmodule
