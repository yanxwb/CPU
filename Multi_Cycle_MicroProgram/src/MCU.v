`timescale 1ns/1ps
module MCU (
    input clk,
    input [5:0] OP_Code,
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
    output RegDst
); 
    wire [1:0] Caddr;
    wire [2:0] TransIn;
    wire [3:0] ROM1Out, ROM2Out;
    wire [3:0] AddrIn, AddrOut, AddOut;
    wire [14:0] MicroIR;
    ADD4 add4(AddrOut, 4'b0001, AddOut);
    MUX4 mux4(.Ctrl(Caddr), .i0(4'b0000), .i1(ROM1Out), .i2(ROM2Out), .i3(AddOut), .out(AddrIn));
    CMAR cmar(.clk(clk), .AddrIn(AddrIn), .AddrOut(AddrOut));
    ROM1 rom1(OP_Code, ROM1Out);
    ROM2 rom2(OP_Code, ROM2Out);
    ROM rom(AddrOut, MicroIR);
    muIR muir(.MicroIR(MicroIR), .PCWr(PCWr), .PCWrCond(PCWrCond), .IorD(IorD), .MemRd(MemRd), .TransIn(TransIn), .ALUOp(ALUOp), .ALUSrcB(ALUSrcB), .ALUSrcA(ALUSrcA), .RegWr(RegWr), .Caddr(Caddr));
    TRANS trans(.TransIn(TransIn), .MemWr(MemWr), .IRWr(IRWr), .MemtoReg(MemtoReg), .PCSrc(PCSrc), .RegDst(RegDst));
    
endmodule