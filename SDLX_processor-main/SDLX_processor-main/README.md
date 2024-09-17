# SDLX_processor
Implemented the different types of Instructions, on a simple DLX processor and tested the code using testbench in Verilog and checked the working on the Basys3 FPGA. It can operate different types of instructions such as basic Arithmetic and logical, Branch and Jump instructions.

Implemented different type of Instructions namely:
1. R-type triadic 
2. R-I type triadic
3. R-type dyadic

R-type triadic Instructions:
This type of instrutions include of arithmetic and logical operations between the data present in the registers(RS1,RS2) of Register file, and the output from the ALU is feeded into the destination Register(RD).
Segmentation of IR(32 bits) in R-type triadic instructions: |0|RS1|RS2|RD|Fncode|

R-I type triadic Instructions:
This type of instrutions include of arithmetic and logical operations between the data present in the Source register(RS1) and immediate data(Imm) present in the Instruction Register, and the output from the ALU is feeded into the destination Register.
Segmentation of IR(32 bits) in R-I type triadic instructions: |Opcode|RS1|RD|Imm|

R-type dyadic Instructions:
This type of instrutions include of branch and jump operations.
Segmentation of IR(32 bits) in R-I type triadic instructions: |Opcode|RS1|0|Imm|


How to operate the Basys3 for the following Verilog code:
1. We will be giving the 32 bit instruction register 8 bits at a time using the last 8 input
switches present on the Basys3 FPGA board by pushing the push button for 1 second
every time after giving the input through the switches. For the execution of instruction to be performed
given by the Instruction register we have to press the push button for 2 seconds.
2. And the first two inputs switches on the baysy3 board is aasigned as the reset and a display signal which controls
whether to display the PC or ALU output on the Seven segment display, and output LEDs.
