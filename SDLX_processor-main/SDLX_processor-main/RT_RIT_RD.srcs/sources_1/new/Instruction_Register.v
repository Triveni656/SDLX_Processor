`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04.03.2023 11:16:48
// Design Name: 
// Module Name: Instruction_Register
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


module Instruction_Register(main_clk, processing_clk, IR_clk, reset, IR, D_IN, instruction_load);
  input [3:0]IR_clk; // this is the gate to the main_clk when it is high at some bit from any one of the 4-bits then respective 8 bits of IR will get updated 
  input main_clk; // clk with 100Mhz
  input processing_clk; // only when it is one then the IR will be loaded 
  input reset; // reset the Instruction register
  input [7:0]D_IN;
  output reg [31:0]IR;
  output reg instruction_load;
  reg [31:0]temp_IR; // Instruction register
  

  always@(posedge main_clk or posedge reset) // to load 7:0 bits of temp_IR  
    begin
     if(reset)
       begin
         temp_IR[31:0] <= 0;
         IR <= 0;
       end
     else if(processing_clk)
        begin
         IR <= temp_IR;
         instruction_load = 1;
        end
     else
       begin
         casex(IR_clk)
         4'b0001:begin // for 7:0 loading we will use switch U17
             temp_IR[7:0] <= D_IN;
             temp_IR[31:8] <= temp_IR[31:8];  
             end
         4'b001x:begin // for 15:8 loading we will use switch T17
             temp_IR[15:8] <= D_IN;
             temp_IR[7:0] <= temp_IR[7:0];
             temp_IR[31:16] <= temp_IR[31:16];        
             end  
         4'b01xx:begin // for 23:16 loading we will use switch T18
              temp_IR[23:16] <= D_IN;
              temp_IR[15:0] <= temp_IR[15:0];
              temp_IR[31:24] <= temp_IR[31:24]; 
              end
         4'b1xxx:begin // loading from 31 to 0 from MSB to LSB for 31:24 loading we will use switch W19
              temp_IR[31:24] <= D_IN;
              temp_IR[23:0] <= temp_IR[23:0];  
              end
         default:begin
              temp_IR[31:0] <= temp_IR[31:0];
              end
         endcase              
       end
     end
            
endmodule
