`timescale 1ns/1ps
module ROM2 (
    input [5:0] OP_Code,
    output reg [3:0] AddrIn
);
    always @(*) begin
        AddrIn = 4'b0000;
        case(OP_Code)
            6'b100011:
                AddrIn = 4'b0011;
            6'b101011:
                AddrIn = 4'b0101;
        endcase
    end
endmodule