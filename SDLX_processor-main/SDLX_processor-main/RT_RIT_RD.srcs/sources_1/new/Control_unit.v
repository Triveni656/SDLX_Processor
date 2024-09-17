`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10.03.2023 15:20:50
// Design Name: 
// Module Name: Control_unit
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


module Control_unit(main_clk, opcode, fncode, RS1is0, WE, RD_sel, Operand1_sel, Operand2_sel, Din_sel2, NextPC, Extn_ctrl);
    input [5:0]opcode;
    input [5:0]fncode;
    input RS1is0, main_clk;
    output reg WE;
    output reg [1:0]RD_sel;
    output reg Operand1_sel;
    output reg Operand2_sel;
    output reg Din_sel2;
    output reg NextPC;
    output reg [1:0]Extn_ctrl;
    
    always@(*)
        begin
        if (opcode==6'b000000)
           begin
             WE <= 1'b1;
             RD_sel <= 2'b00 ;
             Operand1_sel <= 1'b0;
             Operand2_sel <= 1'b1;
             Din_sel2 <= 1'b0;
             NextPC <= 1'b0;
             Extn_ctrl <= 2'b00;
           end
           
         else if (opcode== 6'b100001) //subtract immediate
            begin
             WE = 1'b1;
             RD_sel = 2'b01 ;
             Operand1_sel = 1'b0;
             Operand2_sel = 1'b0;
             Din_sel2 = 1'b0;
             NextPC = 1'b0;
             Extn_ctrl = 2'b00; // unsigned_extension        
             end
             
         else if (opcode == 6'b100010) // and immediate
             begin
             WE = 1'b1;
             RD_sel = 2'b01 ;
             Operand1_sel = 1'b0;
             Operand2_sel = 1'b0;
             Din_sel2 = 1'b0;
             NextPC = 1'b0;
             Extn_ctrl = 2'b00; // unsigned_extension
             end  
             
         else if (opcode == 6'b100011) // or immediate
             begin
             WE = 1'b1;
             RD_sel = 2'b01 ;
             Operand1_sel = 1'b0;
             Operand2_sel = 1'b0;
             Din_sel2 = 1'b0;
             NextPC = 1'b0;
             Extn_ctrl = 2'b00; // unsigned_extension
             end 
             
          else if (opcode == 6'b100100) // xor immediate 
             begin
             WE = 1'b1;
             RD_sel = 2'b01 ;
             Operand1_sel = 1'b0;
             Operand2_sel = 1'b0;
             Din_sel2 = 1'b0;
             NextPC = 1'b0;
             Extn_ctrl = 2'b00; // unsigned_extension
             end  
             
          else if (opcode == 6'b100101) // shift_left logic imm
             begin
             WE = 1'b1;
             RD_sel = 2'b01 ;
             Operand1_sel = 1'b0;
             Operand2_sel = 1'b0;
             Din_sel2 = 1'b0;
             NextPC = 1'b0;
             Extn_ctrl = 2'b00; // unsigned_extension
             end  
             
         else if (opcode == 6'b100110) // shift_right logic imm
             begin
             WE = 1'b1;
             RD_sel = 2'b01 ;
             Operand1_sel = 1'b0;
             Operand2_sel = 1'b0;
             Din_sel2 = 1'b0;
             NextPC = 1'b0;
             Extn_ctrl = 2'b00; // unsigned extension
             end  
             
         else if (opcode == 6'b100111) // shift_right arithmetic imm 
             begin
             WE = 1'b1;
             RD_sel = 2'b01 ;
             Operand1_sel = 1'b0;
             Operand2_sel = 1'b0;
             Din_sel2 = 1'b0;
             NextPC = 1'b0;
             Extn_ctrl = 2'b00; // unsigned extension
             end  
             
         else if (opcode == 6'b101000) // rotate_left imm 
             begin
             WE = 1'b1;
             RD_sel = 2'b01 ;
             Operand1_sel = 1'b0;
             Operand2_sel = 1'b0;
             Din_sel2 = 1'b0;
             NextPC = 1'b0;
             Extn_ctrl = 2'b00; // unsigned_extension
             end  
             
          else if (opcode == 6'b101001) // rotate_right imm 
             begin 
             WE = 1'b1;
             RD_sel = 2'b01 ;
             Operand1_sel = 1'b0;
             Operand2_sel = 1'b0;
             Din_sel2 = 1'b0;
             NextPC = 1'b0;
             Extn_ctrl = 2'b00; // unsigned_extension
             end          
                                                                                             
          else if (opcode == 6'b101010) // SLT imm
             begin
             WE = 1'b1;
             RD_sel = 2'b01 ;
             Operand1_sel = 1'b0;
             Operand2_sel = 1'b0;
             Din_sel2 = 1'b0;
             NextPC = 1'b0;
             Extn_ctrl = 2'b01; // signed_extension
             end     
                                       
         else if (opcode == 6'b101011) // SGT imm
             begin
             WE = 1'b1;
             RD_sel = 2'b01 ;
             Operand1_sel = 1'b0;
             Operand2_sel = 1'b0;
             Din_sel2 = 1'b0;
             NextPC = 1'b0;
             Extn_ctrl = 2'b01; // signed_extension
             end     
                                
          else if (opcode == 6'b101100) // SLE imm
             begin
             WE = 1'b1;
             RD_sel = 2'b01 ;
             Operand1_sel = 1'b0;
             Operand2_sel = 1'b0;
             Din_sel2 = 1'b0;
             NextPC = 1'b0;
             Extn_ctrl = 2'b01; // signed_extension
             end     
                
           else if (opcode == 6'b101101) // SGE imm
             begin
             WE = 1'b1;
             RD_sel = 2'b01 ;
             Operand1_sel = 1'b0;
             Operand2_sel = 1'b0;
             Din_sel2 = 1'b0;
             NextPC = 1'b0;
             Extn_ctrl = 2'b01; // signed_extension
             end
             
          else if (opcode == 6'b101110) // UGT imm
             begin
             WE = 1'b1;
             RD_sel = 2'b01 ;
             Operand1_sel = 1'b0;
             Operand2_sel = 1'b0;
             Din_sel2 = 1'b0;
             NextPC = 1'b0;
             Extn_ctrl = 2'b00; // unsigned_extension
             end        
               
           else if (opcode == 6'b101111) //  ULT imm
             begin
             WE = 1'b1;
             RD_sel = 2'b01 ;
             Operand1_sel = 1'b0;
             Operand2_sel = 1'b0;
             Din_sel2 = 1'b0;
             NextPC = 1'b0;
             Extn_ctrl = 2'b00; // unsigned_extension
             end  
             
           else if (opcode == 6'b110000) // ULE imm
             begin 
             WE = 1'b1;
             RD_sel = 2'b01 ;
             Operand1_sel = 1'b0;
             Operand2_sel = 1'b0;
             Din_sel2 = 1'b0;
             NextPC = 1'b0;
             Extn_ctrl = 2'b00; // unsigned_extension
             end    
             
           else if (opcode == 6'b110001) // UGE imm
             begin
             WE = 1'b1;
             RD_sel = 2'b01 ;
             Operand1_sel = 1'b0;
             Operand2_sel = 1'b0;
             Din_sel2 = 1'b0;
             NextPC = 1'b0;
             Extn_ctrl = 2'b00; // unsigned_extension
             end  
             
           else if (opcode == 6'b110010) // add imm
             begin
             WE = 1'b1;
             RD_sel = 2'b01 ;
             Operand1_sel = 1'b0;
             Operand2_sel = 1'b0;
             Din_sel2 = 1'b0;
             NextPC = 1'b0;
             Extn_ctrl = 2'b00; // unsigned_extension
             end    
             
           else if (opcode == 6'b110011) // BEQZ imm
             begin
             WE = 1'b0;
             Operand1_sel = 1'b1;
             Operand2_sel = 1'b0;
             Din_sel2 = 1'b0;
             if (RS1is0)
             begin
              NextPC = 1'b1;
             end
             else
             begin
              NextPC = 1'b0;
             end
             Extn_ctrl = 2'b01; // signed_extension
             end   
             
           else if (opcode == 6'b110100) //  BNEZ imm
             begin
             WE = 1'b0;
             Operand1_sel = 1'b1;
             Operand2_sel = 1'b0;
             Din_sel2 = 1'b0;
             if (RS1is0)
             begin
              NextPC = 1'b0;
             end
             else
             begin
              NextPC = 1'b1;
             end
             Extn_ctrl = 2'b01; // signed_extension 
             end    
                        
           else if (opcode == 6'b110101) // JR 
             begin
             WE = 1'b0;
             Operand1_sel = 1'b0;
             Operand2_sel = 1'b0;
             Din_sel2 = 1'b0;
             NextPC = 1'b1;
             Extn_ctrl = 2'b01; // signed_extension
             end      
                      
           else if (opcode == 6'b110110) // JALR
             begin
             WE = 1'b1;
             RD_sel = 2'b11;
             Operand1_sel = 1'b0;
             Operand2_sel = 1'b0;
             Din_sel2 = 1'b1;
             NextPC = 1'b1;
             Extn_ctrl = 2'b01; // signed_extension
             end            
        end
endmodule
