`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/03/2020 03:31:42 PM
// Design Name: 
// Module Name: an_decode
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


module an_decode(
    input [1:0] dig_sel,
    output reg [3:0] an
    );
   
    always @*
        begin 
        case(dig_sel)
        0: an<=4'b1110;
        1: an<=4'b1101;
        2: an<=4'b1011;
        default: an<=4'b0111;
    endcase
    end
endmodule
