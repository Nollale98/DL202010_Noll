`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/09/2020 04:39:03 PM
// Design Name: 
// Module Name: counter
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


module counter#( parameter N=1)
(
input clk , rst , en ,
output [N -1:0]  count ,
output  tick
);
//  internal  signals
reg [N -1:0]  Q_reg , Q_next;
//  register (state  memory)
always @(posedge clk , posedge  rst)
begin
if (rst)
Q_reg  <= 0;
else
Q_reg  <= Q_next;
end
// next -state  logic
always @*
begin
if (en)
Q_next = Q_reg + 1;
else
Q_next = Q_reg;  
end
//  output  logic
assign  count = Q_reg;
assign  tick = (Q_reg =={N{1'b1}}) ? 1'b1 : 1'b0;
endmodule
