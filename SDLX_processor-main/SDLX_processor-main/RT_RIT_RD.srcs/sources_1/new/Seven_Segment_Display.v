`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04.03.2023 11:13:43
// Design Name: 
// Module Name: Seven_Segment_Display
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


    module Seven_Segment_Display(main_clk, reset, OUTB, LED_OUT, Anode_Activate);
    reg [19:0] counter; // this is the counter which helps in updating the values of seven segmented lights, by taking the MSB two bits only into consideration then it will get updated for each one of the our 7-segmented lights one at a time based on the MSB two bits of this counter which will be changing for every __ s
    output reg [3:0]Anode_Activate; // in basys-3 anyone of the 7-segemented display has to be activated at one  time so we need to give signal 
    output reg [6:0]LED_OUT; // defining which lights has to be on 
    input [15:0]OUTB; // these are the MSB 16-bits of ALU output
    reg [3:0]LED_BCD; // to represent upto 15 numbers on every seven segmented display
    input main_clk,reset; // main_clk is of 100Mhz which will increment the counter
    wire [1:0] LED_activating_counter;  
    
    always @(posedge main_clk or posedge reset)
    begin 
     if(reset==1)
      counter <= 0;
     else
      counter <= counter + 1;
    end 
    assign LED_activating_counter = counter[19:18];
      
      
    always @(*)
    begin
        case(LED_activating_counter)
        2'b00: begin
            Anode_Activate <= 4'b0111; // activating 1st seven segmented display i.e., the MSB 4bits of OUT[31:16] (pnp junction diode so you will be giving low to the seven segment led light we want to display)
            LED_BCD <= OUTB[15:12];
             end
        2'b01: begin
            Anode_Activate <= 4'b1011; // activating 2nd seven segmented display
            LED_BCD <= OUTB[11:8];
                end
        2'b10: begin
            Anode_Activate <= 4'b1101; // activating 3rd seven segmented display
            LED_BCD <= OUTB[7:4];
              end
        2'b11: begin
            Anode_Activate <= 4'b1110; // activating 4th seven segmented display i.e., the LSB 4bits of OUT[31:16]
            LED_BCD <= OUTB[3:0];
               end   
        default:begin
                Anode_Activate <= 4'b0111; 
                LED_BCD <= OUTB[15:12];
                end
            endcase
        end
        
    always @(*)
    begin
    
     case(LED_BCD)
     4'b0000: LED_OUT <= 7'b0000001; // "0"  
     4'b0001: LED_OUT <= 7'b1001111; // "1" 
     4'b0010: LED_OUT <= 7'b0010010; // "2" 
     4'b0011: LED_OUT <= 7'b0000110; // "3" 
     4'b0100: LED_OUT <= 7'b1001100; // "4" 
     4'b0101: LED_OUT <= 7'b0100100; // "5" 
     4'b0110: LED_OUT <= 7'b0100000; // "6" 
     4'b0111: LED_OUT <= 7'b0001111; // "7" 
     4'b1000: LED_OUT <= 7'b0000000; // "8"  
     4'b1001: LED_OUT <= 7'b0000100; // "9" 
     4'b1010: LED_OUT <= 7'b0000010; // "A"
     4'b1011: LED_OUT <= 7'b1100000; // "B"
     4'b1100: LED_OUT <= 7'b0110001; // "C"
     4'b1101: LED_OUT <= 7'b1000010; // "D"
     4'b1110: LED_OUT <= 7'b0110000; // "E"
     4'b1111: LED_OUT <= 7'b0111000; // "F"
     default: begin
              LED_OUT <= 7'b0000001; // "0" 
              end
     endcase
     
    end 
    
endmodule