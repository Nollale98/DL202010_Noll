`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/03/2020 02:34:43 PM
// Design Name: 
// Module Name: mux4
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


module mux4
    #(parameter N=1)
    (input [N-1:0] in0, in1, in2, in3,
    input [1:0] dig_sel,
    output reg [N-1:0] out);
    
    always @*
    begin
    case(dig_sel)
    2'b00 : out<=in0;
    2'b01 : out<=in1;
    2'b10 : out<=in2;
    default : out<=in3;
    
    endcase
    end
endmodule
