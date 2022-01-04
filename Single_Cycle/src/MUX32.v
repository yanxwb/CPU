`timescale 1ns/1ps
module MUX32 (
    input Ctrl,
    input [31:0] i0,
    input [31:0] i1,
    output [31:0] out
);
    assign out = (Ctrl == 0) ? i0 : i1;

endmodule