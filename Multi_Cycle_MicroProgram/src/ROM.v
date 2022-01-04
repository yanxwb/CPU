`timescale 1ns/1ps
module ROM (
    input [3:0] AddrIn,
    output reg [14:0] MicroIR
);
    always @(*) begin
        // MicroIR = 0;
        case(AddrIn)
            0:
                MicroIR = 15'b100111000010011;
            1:
                MicroIR = 15'b000000000110001;
            2:
                MicroIR = 15'b000000000101010;
            3:
                MicroIR = 15'b001100000000011;
            4:
                MicroIR = 15'b000010000000100;
            5:
                MicroIR = 15'b001010100000000;
            6:
                MicroIR = 15'b000000010001011;
            7:
                MicroIR = 15'b000000100000100;
            8:
                MicroIR = 15'b010001001001000;
            9:
                MicroIR = 15'b100001100000000; 
        endcase
    end
endmodule