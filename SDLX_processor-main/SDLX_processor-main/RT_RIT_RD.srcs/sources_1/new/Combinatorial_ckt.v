    `timescale 1ns / 1ps
    //////////////////////////////////////////////////////////////////////////////////
    // Company: 
    // Engineer: 
    // 
    // Create Date: 12.03.2023 14:47:31
    // Design Name: 
    // Module Name: Combinatorial_ckt
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
    
    

    module Combinatorial_ckt(opcode, fncode, ALU_Ctrl);
    input [5:0]opcode;
    input [5:0]fncode;
    output reg [5:0]ALU_Ctrl;
    
    always@(*)
    begin
    if(opcode == 6'b000000)
    begin
    case(fncode)
    
    6'b000001: begin
      ALU_Ctrl <= 6'b000001;
      end
    6'b000010:begin
      ALU_Ctrl <= 6'b000010;
      end 
    6'b000011:begin
      ALU_Ctrl <= 6'b000011;
      end 
    6'b000100:begin
      ALU_Ctrl <= 6'b000100;
      end 
    6'b000101:begin
      ALU_Ctrl <= 6'b000101;
      end 
    6'b000110:begin
      ALU_Ctrl <= 6'b000110;
      end 
    6'b000111:begin
      ALU_Ctrl <= 6'b000111;
      end 
    6'b001000:begin
      ALU_Ctrl <= 6'b001000;
      end     
    6'b001001:begin
      ALU_Ctrl <= 6'b001001;
      end 
    6'b001010:begin
      ALU_Ctrl <= 6'b001010;
      end 
    6'b001011:begin
      ALU_Ctrl <= 6'b001011;
      end 
    6'b001100:begin
      ALU_Ctrl <= 6'b001100;
      end 
    6'b001101:begin
      ALU_Ctrl <= 6'b001101;
      end 
    6'b001110:begin
      ALU_Ctrl <= 6'b001110;
      end 
    6'b001111:begin
      ALU_Ctrl <= 6'b001111;
      end 
    6'b010000:begin
      ALU_Ctrl <= 6'b010000;
      end 
    6'b010001:begin
      ALU_Ctrl <= 6'b010001;
      end 
    6'b010010:begin
      ALU_Ctrl <= 6'b010010;
      end
    endcase
    end
    
    
    else if (opcode== 6'b100001) //subtract immediate
    begin
    ALU_Ctrl = 6'b000001;  
    end
    
    else if (opcode == 6'b100010) // and immediate
    begin
    ALU_Ctrl = 6'b000010;
    end  
    
    else if (opcode == 6'b100011) // or immediate
    begin
    ALU_Ctrl = 6'b000011;
    end 
    
    else if (opcode == 6'b100100) // xor immediate 
    begin
    ALU_Ctrl = 6'b000100;
    end  
    
    else if (opcode == 6'b100101) // shift_left logic imm
    begin
    ALU_Ctrl = 6'b000101;
    end  
    
    else if (opcode == 6'b100110) // shift_right logic imm
    begin
    ALU_Ctrl = 6'b000110;
    end  
    
    else if (opcode == 6'b100111) // shift_right arithmetic imm 
    begin
    ALU_Ctrl = 6'b000111;
    end  
    
    else if (opcode == 6'b101000) // rotate_left imm 
    begin
    ALU_Ctrl = 6'b001000;
    end  
    
    else if (opcode == 6'b101001) // rotate_right imm 
    begin 
    ALU_Ctrl = 6'b001001;
    end          
                                                                         
    else if (opcode == 6'b101010) // SLT imm
    begin
    ALU_Ctrl = 6'b001010;
    end     
                   
    else if (opcode == 6'b101011) // SGT imm
    begin
    ALU_Ctrl = 6'b001011;
    end     
            
    else if (opcode == 6'b101100) // SLE imm
    begin
    ALU_Ctrl = 6'b001100;
    end     
    
    else if (opcode == 6'b101101) // SGE imm
    begin
    ALU_Ctrl = 6'b001101;
    end
    
    else if (opcode == 6'b101110) // UGT imm
    begin
    ALU_Ctrl = 6'b001110; // unsigned_extension
    end        
    
    else if (opcode == 6'b101111) //  ULT imm
    begin
    ALU_Ctrl = 6'b001111;
    end  
    
    else if (opcode == 6'b110000) // ULE imm
    begin 
    ALU_Ctrl = 6'b010000;
    end    
    
    else if (opcode == 6'b110001) // UGE imm
    begin
    ALU_Ctrl = 6'b010001;
    end  
    
    else if (opcode == 6'b110010) // add imm
    begin
    ALU_Ctrl = 6'b010010;
    end    
    
    else if (opcode == 6'b110011) // BEQZ imm
    begin
    ALU_Ctrl = 6'b010011; //ADD4
    end   
    
    else if (opcode == 6'b110100) //  BNEZ imm
    begin
    ALU_Ctrl = 6'b010011; //ADD4
    end    
    
    else if (opcode == 6'b110101) // JR 
    begin
    ALU_Ctrl = 6'b010011; //ADD4
    end      
    
    else if (opcode == 6'b110110) // JALR
    begin
    ALU_Ctrl = 6'b010011; //ADD4
    end            
    
    end
    
    endmodule
