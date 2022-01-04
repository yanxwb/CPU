`timescale 1ns/1ps
module IM (
    input [31:0] Addr,
    output reg [31:0] Inst
);
    reg [7:0] mem [0:63];
    initial begin
        $readmemb("IM.txt",mem);
    end
    always @(*) begin
        Inst = {mem[Addr], mem[Addr + 1], mem[Addr + 2], mem[Addr + 3]};
    end
endmodule