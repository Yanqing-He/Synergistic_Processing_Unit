module Mux3to1(sel, in1, in2, in3, out);
    parameter dataWidth = 128;
    input [dataWidth - 1: 0] in1, in2, in3;
    input [1: 0] sel;
    output logic [dataWidth - 1: 0] out;
    
    always_comb
    begin
        if(sel == 2'b00)
            out = in1;
        else if(sel == 2'b01)
            out = in2;
        else if(sel == 2'b10)
            out = in3;
        else
            out = 'bz;
    end
endmodule
