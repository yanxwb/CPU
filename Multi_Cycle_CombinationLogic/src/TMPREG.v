`timescale 1ns/1ps
module TMPREG (
    input clk,
    input [31:0] D,
    output reg[31:0] Q
);
    always @(posedge clk ) begin
        Q <= D;
    end
    
endmodule