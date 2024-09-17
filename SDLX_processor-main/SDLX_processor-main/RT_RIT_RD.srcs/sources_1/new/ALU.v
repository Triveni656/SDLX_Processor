`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04.03.2023 11:12:23
// Design Name: 
// Module Name: ALU
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


module ALU(A, B, OUT, ALU_Ctrl);

  input [31:0]A;
  input [31:0]B;
  input [5:0]ALU_Ctrl;
  output reg [31:0]OUT;
    
  wire signed [31:0] signed_A;
  wire signed [31:0] signed_B;
  wire signed [31:0] add_4;
  wire [31:0]rotate_left,rotate_right;
  assign rotate_left = (A << B) | (A >> (32'd32-B));
  assign rotate_right =  (A >> B) | (A << (32'd32-B));
  assign signed_A = $signed(A); // taking the 2's complement form of A
  assign signed_B = $signed(B); // taking the 2's complement form of B
  assign add_4 = A + (signed_B << 2);
  
  always@(*)
    begin
                case(ALU_Ctrl) // operations that can be performed by the ALU 
                6'b000001:begin
                OUT <= A-B; // sub
                end 
                6'b000010:begin
                OUT <= A&B; // and
                end 
                6'b000011:begin
                OUT <= A|B; // or
                end 
                6'b000100:begin
                OUT <= A^B; // xor
                end 
                6'b000101:begin
                OUT[31:0] <= A << B; // shift left logical
                end
                6'b000110:begin
                OUT[31:0] <= A >>> B; // shift right logical
                end
                6'b000111:begin
                OUT[31:0] <= A >> B; // shift right arthimetic 
                end
                6'b001000:begin
                OUT[31:0] <= rotate_left; // rotate left
                end       
                6'b001001:begin
                OUT[31:0] <= rotate_right; // rotate right 
                end
                6'b001010:begin
                if(signed_A<signed_B) OUT[31:0] <= 32'b1; // signed less than comparision
                else OUT[31:0] <= 32'b0; 
                end 
                6'b001011:begin
                if(signed_A>signed_B) OUT[31:0] <= 32'b1; // signed greater than comparision
                else OUT[31:0] <= 32'b0; 
                end
                6'b001100:begin
                if(signed_A<=signed_B) OUT[31:0] <= 32'b1; // signed less than or equal to comparision
                else OUT[31:0] <= 32'b0; 
                end
                6'b001101:begin
                if(signed_A>=signed_B) OUT[31:0] <= 32'b1; // signed greater than or equal to comparision
                else OUT[31:0] <= 32'b0; 
                end
                6'b001110:begin
                if(A>B) OUT[31:0] <= 32'b1; // unsigned greater than comparision
                else OUT[31:0] <= 32'b0; 
                end
                6'b001111:begin
                if(A<B) OUT[31:0] <= 32'b1; // unsigned less than comparision
                else OUT[31:0] <= 32'b0; 
                end
                6'b010000:begin
                if(A<=B) OUT[31:0] <= 32'b1; // unsigned less than or equal to comparision
                else OUT[31:0] <= 32'b0; 
                end
                6'b010001:begin
                if(A>=B) OUT[31:0] <= 32'b1; // unsigned greater than or equal to comparision
                else OUT[31:0] <= 32'b0; 
                end
                6'b010010:begin
                OUT <= A+B; // add
                end 
                6'b010011:begin // ADD4
                OUT <= add_4;
                end 
                default:begin
                OUT <= OUT;
                end
                endcase 
    end
        
endmodule
