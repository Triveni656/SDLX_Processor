`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09.03.2023 03:48:34
// Design Name: 
// Module Name: PC
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


module PC(reset, PC, main_clk, OUT, Future_PC, processing_clk, temp_PC);
    input reset, processing_clk;
    input main_clk;
    input [31:0]OUT;
    input [29:0]Future_PC;
    output reg [29:0]PC; 
    output reg [29:0]temp_PC;   
    reg [1:0]count;
    
    always@(posedge main_clk)
    begin
        count = count + 1;
        if(reset)
        begin
            PC <= 0;
            count <= 0; 
        end

        else
        begin
        if(processing_clk && count == 2'b10)
        begin
            temp_PC <= PC;
            PC <= Future_PC;
            count = 2'b00;
        end
    end 
    end
    
endmodule
