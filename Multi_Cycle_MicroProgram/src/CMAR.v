`timescale 1ns/1ps
module CMAR (
    input clk,
    input [3:0] AddrIn,
    output reg [3:0] AddrOut
);
    reg [3:0] TmpAddr;
    initial begin
        AddrOut = 0;
    end
    always @(posedge clk ) begin
        AddrOut <= AddrIn;
    end
endmodule