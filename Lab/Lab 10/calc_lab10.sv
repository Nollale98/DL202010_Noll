`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/12/2020 10:43:59 PM
// Design Name: 
// Module Name: calc_lab10
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


module calc_lab10(
    input [15:0] sw,
    input btnU, btnD, btnC, reg clk,
    output [3:0] an,
    output [6:0] seg,
    output dp,
    output [15:0] led
    );
    
    wire [15:0] interm1;

top_lab9 calc_unit (.sw(sw[11:0]),.btnU(btnU),.btnD(btnD),.btnC(btnC),.clk(clk),.led(led));

    assign interm1={sw[15:14],6'b000000,led[15:8]};

sseg_TDM disp_unit (.sw(interm1),.reset(btnC),.clock(clk),.an(an),.seg(seg),.dp(dp));


endmodule
