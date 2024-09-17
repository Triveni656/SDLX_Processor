    `timescale 1ns / 1ps
    //////////////////////////////////////////////////////////////////////////////////
    // Company: 
    // Engineer: 
    // 
    // Create Date: 12.03.2023 23:04:38
    // Design Name: 
    // Module Name: top_module_slowed_clk
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
    
    
    module top_module_slowed_clk(PC_OUT, main_clk, IR_clk, reset, D_IN, processing_clk, Anode_Activate, OUT_A, LED_OUT);
    input PC_OUT;
    input main_clk; // it is the main clk which goes into every module except ALU
    input processing_clk; // it is acting as a gate to the main_clk and any update or execution of all the operations will be done by this 
    // IR: 
    input [3:0]IR_clk; // this clk will load the IR 8-bit at a time 
    input reset; // it is asynchronous reset which will reset the IR 
    input [7:0]D_IN; // this is the 8-bit input we are giving to load the IR at each clk
    output [3:0]Anode_Activate; // based on this we are picking one of the four 7 segmented displays` qasc
    output [6:0]LED_OUT; // Seven segment output (LED Display)
    output [15:0]OUT_A; // the 16 LSB bits of Output
    
    wire slowed_clk;
    wire [15:0]Display_bits;
    wire [31:0]OUT;
    wire [29:0]PC;
    
    clkdiv clkdiv1(.clk(main_clk),.slowed_clk(slowed_clk));
    // Display: 
    assign Display_bits = (PC_OUT)?OUT[31:16]:{2'b00,PC[29:16]}; 
    assign OUT_A = (PC_OUT)?OUT[15:0]:PC[15:0];
    
    Seven_Segment_Display LED_DISPLAY(.main_clk(main_clk),.reset(reset),.OUTB(Display_bits),.LED_OUT(LED_OUT),.Anode_Activate(Anode_Activate)); // using this module to represent the first MSB 16 bits on the seven segment display  
    top_module top_module_1(.main_clk(slowed_clk), .IR_clk(IR_clk), .reset(reset), .D_IN(D_IN), .processing_clk(processing_clk), .New_OUT(OUT), .New_PC(PC));
    endmodule
