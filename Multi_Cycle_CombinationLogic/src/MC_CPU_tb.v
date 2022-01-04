`timescale 1ns/1ps
module MC_CPU_tb (
);
    reg clk;
    reg reset;
    integer i;
    MC_CPU mc_cpu(clk, reset);

    initial begin
        $dumpfile("./build/mc_wave.vcd"); 
	    $dumpvars(0, MC_CPU_tb);
        clk = 0;
        reset = 1;
        # 5;
        reset = 0;
        # 5;     
        for(i = 0;i < 114; i = i + 1) begin
            clk = ~clk;
            #5;
        end  
        $finish;
    end
endmodule