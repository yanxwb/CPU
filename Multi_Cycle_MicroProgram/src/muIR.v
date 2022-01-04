`timescale 1ns/1ps
module muIR (
    input [14:0] MicroIR,
    output PCWr,
    output PCWrCond,
    output IorD,
    output MemRd,
    output [2:0] TransIn,
    output [1:0] ALUOp,
    output [1:0] ALUSrcB,
    output ALUSrcA,
    output RegWr,
    output [1:0] Caddr
);
    assign PCWr = MicroIR[14];
    assign PCWrCond = MicroIR[13];
    assign IorD = MicroIR[12];
    assign MemRd = MicroIR[11];
    assign TransIn = MicroIR[10:8];
    assign ALUOp = MicroIR[7:6];
    assign ALUSrcB = MicroIR[5:4];
    assign ALUSrcA = MicroIR[3];
    assign RegWr = MicroIR[2];
    assign Caddr = MicroIR[1:0];
endmodule