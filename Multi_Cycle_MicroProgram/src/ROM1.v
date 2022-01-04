`timescale 1ns/1ps
module ROM1 (
    input [5:0] OP_Code,
    output reg [3:0] AddrIn
);
    always @(*) begin
        AddrIn = 4'b0000;
        case(OP_Code)
            6'b000000:
                AddrIn = 4'b0110;
            6'b000010:
                AddrIn = 4'b1001;
            6'b000100:
                AddrIn = 4'b1000;
            6'b100011:
                AddrIn = 4'b0010;
            6'b101011:
                AddrIn = 4'b0010;
        endcase
    end
endmodule