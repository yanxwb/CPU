`timescale 1ns/1ps
module TRANS (
    input [2:0] TransIn,
    output reg RegDst,
    output reg [1:0] PCSrc,
    output reg MemtoReg,
    output reg MemWr,
    output reg IRWr
);
    always @(*) begin
        RegDst = 0;
        PCSrc = 0;
        MemtoReg = 0;
        MemWr = 0;
        IRWr = 0;
        case(TransIn)
            1:
                RegDst = 1;
            2:
                PCSrc[0] = 1;
            3: 
                PCSrc[1] = 1;
            4:
                MemtoReg = 1;
            5:
                MemWr = 1;
            6:
                IRWr = 1;
        endcase 
    end
endmodule