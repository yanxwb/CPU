iverilog -o ./build/sc.out ./src/ADD4.v ./src/ALU.v ./src/ALUCU.v ./src/CMAR.v ./src/DM.v ./src/IR.v ./src/MUX4.v ./src/MUX5.v ./src/MUX32_2.v ./src/MUX32_4.v ./src/PC.v ./src/RF.v ./src/ROM.v ./src/ROM1.v ./src/ROM2.v ./src/SHL2_26.v ./src/SHL2_32.v ./src/SigExt.v ./src/muIR.v ./src/MDR.v ./src/TMPREG.v ./src/TRANS.v ./src/MCU.v ./src/MC_CPU.v ./src/MC_CPU_tb.v
vvp -n ./build/sc.out