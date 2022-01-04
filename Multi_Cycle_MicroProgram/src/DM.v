`timescale 1ns/1ps
module DM (
    input R,
    input W,
    input IorD,
    input [31:0] Addr,
    input [31:0] W_data,
    output reg [31:0] R_data
);
    reg [7:0] mem[0:95];
    integer fd1, i;
    initial begin
        $readmemb("DM.txt", mem);
    end
    always @(*) begin
        if (R == 1) begin
            if(IorD == 0)
                R_data <= {mem[32 + Addr], mem[32 + Addr + 1], mem[32 + Addr + 2], mem[32 + Addr + 3]};
            else
                R_data <= {mem[(Addr << 2)], mem[(Addr << 2) + 1], mem[(Addr << 2) + 2], mem[(Addr << 2) + 3]};
        end
        if (W == 1) begin
            mem[(Addr << 2)] = W_data[31:24];
            mem[(Addr << 2) + 1] = W_data[23:16];
            mem[(Addr << 2) + 2] = W_data[15:8];
            mem[(Addr << 2) + 3] = W_data[7:0];

            fd1 = $fopen("DM.txt");
            for(i = 0; i <= 95; i = i + 1) begin
                $fdisplay(fd1, "%b", mem[i]);
                if (i % 4 == 3)
                    $fdisplay(fd1, "");
            end
            $fclose(fd1);
            
        end
    end
endmodule