`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/01/2020 12:35:37 AM
// Design Name: 
// Module Name: alu_test
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


module alu_test();
reg [7:0] in0;
reg [7:0] in1;
reg [3:0] op;
wire [7:0] out;

alu #(.N(8)) ALU(.in0(in0),.in1(in1),.op(op),.out(out));

initial
    begin
    in0 = 12;
    in1 = 7;
    op=0;   #5;
    op=1;   #5;
    op=2;   #5;
    op=3;   #5;
    op=4;   #5;
    
    $finish;
    end
endmodule
