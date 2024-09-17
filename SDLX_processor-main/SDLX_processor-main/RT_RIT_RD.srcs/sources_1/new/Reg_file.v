`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04.03.2023 11:13:01
// Design Name: 
// Module Name: Reg_file
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



module Reg_file(main_clk, WE, load_data, RD, R1, R2, Q1, Q2);
//  input processing_clk; // serves as a gate to the main_clk, when this input is high then it will pass the main_clk to the Register_file
  input main_clk; // main main_clk of 100MHz
  input WE; // write enable signal to write the output of ALU into reg file
  input [4:0]RD,R1,R2;
  input [31:0]load_data;
  output [31:0]Q1,Q2;
  reg [31:0]Registers[31:0];
  
  initial Registers[0] = 32'd0;
  initial Registers[1] = 32'd100;
  initial Registers[2] = 32'd8;
  initial Registers[3] = 32'd44;
  initial Registers[4] = 32'd51;
  initial Registers[5] = 32'd10000000;
  initial Registers[6] = 32'd10000;
  initial Registers[7] = 32'd190901;
  initial Registers[8] = 32'd90390;
  initial Registers[9] = 32'b0;
  
  assign Q1 = Registers[R1];
  assign Q2 = Registers[R2];
  
  always@(posedge main_clk) begin
    if(WE)
      begin
        Registers[RD] <= load_data;
      end
  end
  
endmodule