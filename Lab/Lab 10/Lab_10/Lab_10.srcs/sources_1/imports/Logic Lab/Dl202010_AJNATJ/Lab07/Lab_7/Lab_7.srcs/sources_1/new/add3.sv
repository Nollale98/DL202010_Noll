`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/25/2020 02:37:06 PM
// Design Name: 
// Module Name: add3
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


module add3(input [3:0] num, output [3:0] result);
    
    reg [3:0] temp;

    always @*
        begin
            if (num > 4'b0100)  
                 temp = num + 4'b0011;
            else
                 temp = num;
        end
        
    assign result = temp;
        
endmodule
