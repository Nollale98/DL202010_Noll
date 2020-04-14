`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/01/2020 02:52:57 AM
// Design Name: 
// Module Name: top_lab9
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


module top_lab9(
    input [11:0] sw,
    input btnU, btnD, btnC, reg clk,
    output [15:0] led
    );
    wire [7:0] ALUout;

register #(.N(8)) REG1(.D(sw[7:0]),.en(btnD),.clk(clk),.rst(btnC),.Q(led[7:0]));

alu #(.N(8)) ALU(.in0(sw[7:0]),.in1(led[7:0]),.op(sw[11:8]),.out(ALUout));

register #(.N(8)) REG2(.D(ALUout),.en(btnU),.clk(clk),.rst(btnC),.Q(led[15:8]));
endmodule
