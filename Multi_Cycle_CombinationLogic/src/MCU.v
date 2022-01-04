`timescale 1ns/1ps
module MCU (
    input [5:0] OP_Code,
    input [3:0] S,
    output PCWr,
    output PCWrCond,
    output IorD,
    output MemRd,
    output MemWr,
    output IRWr,
    output MemtoReg,
    output [1:0] PCSrc,
    output [1:0] ALUOp,
    output [1:0] ALUSrcB,
    output ALUSrcA,
    output RegWr,
    output RegDst,
    output [3:0] NS
);
    wire [16:0] Tmp;
    assign Tmp[16] = !S;
    assign Tmp[15] = !S[3:1] & S[0];
    assign Tmp[14] = !S[3:2] & S[1] & !S[0];
    assign Tmp[13] = !S[3:2] & !(~S[1:0]);
    assign Tmp[12] = !S[3] & !(~S[2]) & !S[1:0];
    assign Tmp[11] = !S[3] & S[2] & !S[1] & S[0];
    assign Tmp[10] = !S[3] & !(~S[2:1]) & !S[0];
    assign Tmp[9] = !S[3] & !(~S[2:0]);
    assign Tmp[8] = S[3] & !S[2:0];
    assign Tmp[7] = S[3] & !S[2:1] & S[0];
    assign Tmp[6] = !OP_Code[5:2] & OP_Code[1] &!OP_Code[0] & !S[3:1] & S[0];
    assign Tmp[5] = !OP_Code[5:3] & OP_Code[2] & !OP_Code[1:0] & !S[3:1] & S[0];
    assign Tmp[4] = !OP_Code & !S[3:1] & S[0];
    assign Tmp[3] = OP_Code[5] & !OP_Code[4:2] & !(~OP_Code[1:0]) & !S[3:2] & S[1] & !S[0];
    assign Tmp[2] = OP_Code[5] & !OP_Code[4] & OP_Code[3] & !OP_Code[2] & !(~OP_Code[1:0]) & !S[3:1] & S[0];
    assign Tmp[1] = OP_Code[5] & !OP_Code[4:2] & !(~OP_Code[1:0]) & !S[3:1] & S[0];
    assign Tmp[0] = OP_Code[5] & !OP_Code[4] & OP_Code[3] & !OP_Code[2] & !(~OP_Code[1:0]) & !S[3:2] & S[1] & !S[0];

    assign PCWr = Tmp[16] | Tmp[7];
    assign PCWrCond = Tmp[8];
    assign IorD = Tmp[13] | Tmp[11];
    assign MemRd = Tmp[16] | Tmp[13];
    assign MemWr = Tmp[11];
    assign IRWr = Tmp[16];
    assign MemtoReg = Tmp[12];
    assign PCSrc[1] = Tmp[7];
    assign PCSrc[0] = Tmp[8];
    assign ALUOp[1] = Tmp[10];
    assign ALUOp[0] = Tmp[8];
    assign ALUSrcB[1] = Tmp[15] | Tmp[14];
    assign ALUSrcB[0] = Tmp[16] | Tmp[15];
    assign ALUSrcA = Tmp[14] | Tmp[10] | Tmp[8];
    assign RegWr = Tmp[12] | Tmp[9];
    assign RegDst = Tmp[9];
    assign NS[3] = Tmp[6] | Tmp[5];
    assign NS[2] = Tmp[13] | Tmp[10] | Tmp[4] | Tmp[0];
    assign NS[1] = Tmp[10] | Tmp[4] | Tmp[3] | Tmp[2] | Tmp[1] ;
    assign NS[0] = Tmp[16] | Tmp[10] | Tmp[6] | Tmp[3] | Tmp[0];
    
endmodule