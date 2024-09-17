`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12.03.2023 17:11:05
// Design Name: 
// Module Name: top_module_tb
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


`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11.03.2023 17:40:16
// Design Name: 
// Module Name: RT_RIT_RD_tb
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

module top_module_tb;
reg main_clk;
reg [3:0]IR_clk;
reg reset;
reg [7:0]D_IN;
reg processing_clk;
wire [31:0]New_OUT; // OUT which will be displayed on the basys3 board
wire [29:0]New_PC;  // PC which will be displayed on the basys3 board

top_module top_module_tb(.main_clk(main_clk), .IR_clk(IR_clk), .reset(reset), .D_IN(D_IN), .processing_clk(processing_clk), .New_OUT(New_OUT), .New_PC(New_PC));

initial begin
main_clk=0;
forever begin
       #20 main_clk=~main_clk;
       end
   end
 // 000000_00011_00010_00000_00000_000101
 
initial begin
        reset=1'b1; #40; 
        // R type triadic
        reset=1'b0; D_IN=8'b00000000; IR_clk=4'b1000; processing_clk=1'b0; #40;
        reset=1'b0; D_IN=8'b10000011; IR_clk=4'b0100; processing_clk=1'b0; #40;
        reset=1'b0; D_IN=8'b00000000; IR_clk=4'b0010; processing_clk=1'b0; #40;
        reset=1'b0; D_IN=8'b00000001; IR_clk=4'b0001; processing_clk=1'b0; #40;
        processing_clk=1; #80; 
        // branch
        reset=1'b0; D_IN=8'b11010000; IR_clk=4'b1000; processing_clk=1'b0; #40;
        reset=1'b0; D_IN=8'b10000011; IR_clk=4'b0100; processing_clk=1'b0; #40;
        reset=1'b0; D_IN=8'b00000000; IR_clk=4'b0010; processing_clk=1'b0; #40;
        reset=1'b0; D_IN=8'b00001010; IR_clk=4'b0001; processing_clk=1'b0; #40;
        processing_clk=1; #80;
        // jmp
        reset=1'b0; D_IN=8'b11011000; IR_clk=4'b1000; processing_clk=1'b0; #40;
        reset=1'b0; D_IN=8'b10000000; IR_clk=4'b0100; processing_clk=1'b0; #40;
        reset=1'b0; D_IN=8'b00000000; IR_clk=4'b0010; processing_clk=1'b0; #40;
        reset=1'b0; D_IN=8'b00001011; IR_clk=4'b0001; processing_clk=1'b0; #40;
        processing_clk=1; #80;
        // immediate
        reset=1'b0; D_IN=8'b10000100; IR_clk=4'b1000; processing_clk=1'b0; #40;
        reset=1'b0; D_IN=8'b01100000; IR_clk=4'b0100; processing_clk=1'b0; #40;
        reset=1'b0; D_IN=8'b00000000; IR_clk=4'b0010; processing_clk=1'b0; #40;
        reset=1'b0; D_IN=8'b00101000; IR_clk=4'b0001; processing_clk=1'b0; #40;
        processing_clk=1; #80;
        // immediate
        reset=1'b0; D_IN=8'b10011100; IR_clk=4'b1000; processing_clk=1'b0; #40;
        reset=1'b0; D_IN=8'b01100000; IR_clk=4'b0100; processing_clk=1'b0; #40;
        reset=1'b0; D_IN=8'b00000000; IR_clk=4'b0010; processing_clk=1'b0; #40;
        reset=1'b0; D_IN=8'b00000001; IR_clk=4'b0001; processing_clk=1'b0; #40;
        processing_clk=1; #80;
        processing_clk=1'b0; #80;
       $finish;
      end
endmodule


