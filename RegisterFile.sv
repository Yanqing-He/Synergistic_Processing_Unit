module RegisterFile(clk, addrWr, addrA, addrB, enWr, busWr, busA, busB);
    parameter dataWidth = 128, addrWidth = 7, memDepth = 128;

    input clk;
    input [addrWidth - 1: 0] addrWr, addrA, addrB;
    input enWr;
    input [dataWidth - 1: 0] busWr;
    output logic [dataWidth - 1: 0] busA, busB;
    logic [dataWidth - 1: 0] mem[memDepth - 1: 0];
    
    always_ff @(posedge clk)
    begin
        if(enWr)
        begin
            mem[addrWr] <= busWr;
        end
    end
    
    always_ff @(negedge clk)
    begin
        busA <= mem[addrA];
        busB <= mem[addrB];
    end
endmodule
