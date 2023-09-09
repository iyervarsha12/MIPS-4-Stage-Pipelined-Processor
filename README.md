# MIPS-4-Stage-Pipelined-Processor

Implemented 4-stage pipelined processor in Verilog. This processor supports constant addition (addi), shift left logical (sll) and Unconditional Jump (J) instructions. 
The processor also implements forwarding to resolve data hazards. 

a. The processor has Reset, CLK as inputs and no outputs. 
b. The processor has instruction fetch unit, register file (with 8 8-bit registers), Execution and Writeback unit. 
c. Read and write operations on Register file can happen simultaneously. 
d. Assumed 8-bit PC. Also Assumed Address and Data size as 8-bits.
