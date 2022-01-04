`timescale 1ns/1ps
module RF (
    input clk,
    input W,
    input [4:0] R_Reg1,
    input [4:0] R_Reg2,
    input [4:0] W_Reg,
    input [31:0] W_data,
    output [31:0] R_data1,
    output [31:0] R_data2
);
    reg [7:0] mem[0:31];
    integer fd1, err1, i;
    initial begin
        $readmemb("RF.txt",mem);
    end
    assign R_data1 = {{mem[(R_Reg1 << 2)]}, {mem[(R_Reg1 << 2) + 1]}, {mem[(R_Reg1 << 2) + 2]}, {mem[(R_Reg1 << 2) + 3]}};
    assign R_data2 = {{mem[(R_Reg2 << 2)]}, {mem[(R_Reg2 << 2) + 1]}, {mem[(R_Reg2 << 2) + 2]}, {mem[(R_Reg2 << 2) + 3]}};
    always @(negedge clk ) begin
        if (W == 1) begin
            mem[(W_Reg << 2)] = W_data[31:24];
            mem[(W_Reg << 2) + 1] = W_data[23:16];
            mem[(W_Reg << 2) + 2] = W_data[15:8];
            mem[(W_Reg << 2) + 3] = W_data[7:0];
        end

        fd1 = $fopen("RF.txt");
        for(i = 0; i < 32; i = i + 1) begin
            $fdisplay(fd1, "%b", mem[i]);
            if (i % 4 == 3)
                $fdisplay(fd1, "");
        end
        $fclose(fd1);
    end
    
endmodule