`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/23/2020 01:53:49 PM
// Design Name: 
// Module Name: mux2_4b
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


module mux2_4b( 
    input [3:0] in0, in1, // inputs and outputs
    input sel, 
    output [3:0] out);
    
    assign out = sel? in1 : in0;
    
    
    
endmodule
