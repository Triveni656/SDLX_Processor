`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04.03.2023 11:19:13
// Design Name: 
// Module Name: RT_RIT_RD
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module top_module(main_clk, IR_clk, reset, D_IN, processing_clk, New_OUT, New_PC);
    
  // main clock:
  input main_clk; // it is the main clk which goes into every module except ALU
  input processing_clk; // it is acting as a gate to the main_clk and any update or execution of all the operations will be done by this 
  
  // IR: 
  input [3:0]IR_clk; // this clk will load the IR 8-bit at a time 
  input reset; // it is asynchronous reset which will reset the IR 
  input [7:0]D_IN; // this is the 8-bit input we are giving to load the IR at each clk
  wire [31:0]IR; // Instruction Register
  
  // PC
  wire [29:0]PC; // program counter
  wire [29:0]Future_PC;
  wire [29:0]temp_PC;
  
  // Instructions: 
  wire [5:0]opcode;
  wire [5:0]fncode;
  
  // Intermediates:
  wire [4:0]RD; // destination register
  wire [4:0]RS1; // source register 1
  wire [4:0]RS2; // source register 2
  wire [31:0]ALU_in1,ALU_in2;
  wire [31:0]Q1,Q2; // The inputs to the ALU, the address to these locations was given by Instruction Register
  wire [31:0]OUT; // output from accumulator
  wire [31:0]Din; // loading data to the regfile
  wire [31:0]immediate_data; // unsigned immediate data
  wire RS1is0;
  
  // control and operand selections needed for different type of instructions
  wire [1:0]RD_sel; // selects between 31(R31) or IR[20:16](R_I), IR[15:11](R_T) 
  wire Operand1_sel; // selects between PC and D1out(reg_file)
  wire Operand2_sel; // selects between D2out(reg_file) or Immediate data
  wire [1:0]Extn_ctrl; // extending the input to 32 bit whether IR[15:0] or IR[25:0]  
  wire Din_sel1; // selects either from the memory or ALU
  wire Din_sel2; // selects either (PC+1)*4 or from ALU  
  wire WE;
  wire NextPC;
  wire [5:0]ALU_Ctrl;
  
  // Outputs:
  output [31:0]New_PC;
  output [31:0]New_OUT;
  assign New_PC = PC;
  assign New_OUT = OUT;

  // for R-I type triadic we need RS1,RD and immediate offset,opcode
  // for R type diadic RS1,immediate offset, opcode
  // for R type triadic we need RS1, RS2, RD, Fn_code


  assign Future_PC = (NextPC)?OUT[31:2]:(PC+1);
  assign opcode = IR[31:26];
  assign fncode = IR[5:0];
  assign RS1is0 = (Q1 == 0)?1:0;
    
  Instruction_Register My_Instruct_Reg(.main_clk(main_clk),.processing_clk(processing_clk),.IR_clk(IR_clk),.reset(reset),.IR(IR),.D_IN(D_IN)); // Loading the Instruction register 
  

  PC My_PC(.reset(reset),.OUT(OUT), .Future_PC(Future_PC), .PC(PC),.main_clk(main_clk),.processing_clk(processing_clk),.temp_PC(temp_PC));


  Control_unit My_Control_unit(.main_clk(main_clk), .opcode(opcode),.fncode(fncode), .RS1is0(RS1is0), .WE(WE), .RD_sel(RD_sel), .Operand1_sel(Operand1_sel), .Operand2_sel(Operand2_sel), .Din_sel2(Din_sel2), .NextPC(NextPC), .Extn_ctrl(Extn_ctrl));
 
// ALU:  
  assign immediate_data = (Extn_ctrl[1])?$signed(IR[25:0]):(Extn_ctrl[0])?$signed(IR[15:0]):$unsigned(IR[15:0]); // if execution ctrl is '1' then there would be sign extension of 26 bits(Extn26_ctrl) to 32 bits otherwise 16 bits(Extm16_ctrl) to 32 bits
  assign ALU_in2 = (Operand2_sel)?Q2:immediate_data; // selection between Q2(data present in R2) or 32-bit immediate data
  assign ALU_in1 = (Operand1_sel)?{PC,2'b0}:Q1; // selection between PC*4 and Q1(data present in R1)
  ALU My_ALU(.A(ALU_in1),.B(ALU_in2),.OUT(OUT),.ALU_Ctrl(ALU_Ctrl)); // Instiating the ALU module

// Reg File:  
  assign Din = (Din_sel2)?{(temp_PC+1),2'b0}:OUT; // selection between (PC+1)*4 or output from the ALU
  assign RD = (RD_sel[1])?5'd31:(RD_sel[0])?IR[20:16]:IR[15:11]; // for RD selection R31 or R-I or R-T
  assign RS1 = IR[25:21]; // same for everything
  assign RS2 = IR[20:16]; // useful only in the case of R-type-triadic
  Reg_file My_Reg_file(.main_clk(main_clk),.WE(WE),.load_data(Din),.RD(RD),.R1(RS1),.R2(RS2),.Q1(Q1),.Q2(Q2)); 

// ALU Ctrl:
  Combinatorial_ckt My_Combinatorial_ckt(.opcode(opcode), .fncode(fncode), .ALU_Ctrl(ALU_Ctrl));
endmodule
