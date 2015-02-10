module DataMemory(clk, enWr, addr, busIn, busOut, enWr1, addr1, busIn1, busOut1, addrInst, instOut);
  parameter dataWidth = 128, addrWidth = 7, memDepth = 256 * 1024;
  
  input clk;
  input enWr, enWr1;
  input [addrWidth - 1: 0] addr, addr1, addrInst;
  input [dataWidth - 1: 0] busIn, busIn1;
  output logic [dataWidth - 1: 0] busOut, busOut1, instOut;
  
  logic [memDepth - 1: 0] mem;
  logic [addrWidth - 1: 0] addrReg, addrReg1;
  
  always_ff @(posedge clk)
  begin
    if(enWr)
    begin
      mem[addr] <= busIn;
    end
    addrReg <= addr;
  end
  
  assign busOut = mem[addrReg];
  
  always_ff @(posedge clk)
  begin
    if(enWr1)
    begin
      mem[addr1] <= busIn1;
    end
    addrReg1 <= addr1;
  end
  
  assign busOut1 = mem[addrReg1];
  
  always_comb
  begin
    instOut = mem[addrInst];
  end
  
endmodule