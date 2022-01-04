`timescale 1ns/1ps
module MUX5 (
    input Ctrl,
    input [4:0] i0,
    input [4:0] i1,
    output [4:0] out
);
    assign out = (Ctrl == 0) ? i0 : i1;

endmodule