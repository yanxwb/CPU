`timescale 1ns/1ps
module MUX4 (
    input [1:0] Ctrl,
    input [3:0] i0,
    input [3:0] i1,
    input [3:0] i2,
    input [3:0] i3,
    output [3:0] out
);
    assign out = (Ctrl == 2'b00) ? i0 : (Ctrl == 2'b01) ? i1 : (Ctrl == 2'b10) ? i2 : i3;

endmodule