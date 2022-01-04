`timescale 1ns/1ps
module SC_CPU_tb (
);
    reg clk;
    reg reset;
    integer i;
    SC_CPU sc_cpu(clk, reset);

    initial begin
        $dumpfile("./build/sc_wave.vcd"); 
	    $dumpvars(0, SC_CPU_tb);
        clk = 0;
        reset = 1;
        # 5;
        clk = ~clk;
        # 5;
        reset = 0;
        #5;
        for(i = 0;i < 31; i = i + 1) begin
            clk = ~clk;
            #5;
        end  
        $finish;
    end
endmodule