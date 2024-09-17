`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12.03.2023 22:58:58
// Design Name: 
// Module Name: clk_div
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


module clkdiv(clk,slowed_clk);
  input clk;
  output reg slowed_clk;
  reg [27:0] counter = 28'd0;// initialising the counter
  parameter temp = 28'd100000000;// the parameter which will help us to increase the time period of clk
  
  always@(posedge clk)
  begin
  counter <= counter+28'd1;
  if(counter>=temp)
  begin
  counter <= 28'd0;// after counter reaching to temp it will again start from 0
  end
  slowed_clk = (counter<temp/2)?1'b0:1'b1; // some part will be 0 and some other part will be 1. 0 to 49999999 - slowed clk will be 0 and then from 50000000 to 99999999 - slowed clk will be 1
  end
  
endmodule
