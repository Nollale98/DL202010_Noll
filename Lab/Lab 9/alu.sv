`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/31/2020 11:17:22 PM
// Design Name: 
// Module Name: alu
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


module  alu #( parameter N=8)
(
output  reg[N -1:0] out ,
input [N -1:0] in0 ,
input [N -1:0] in1 ,
input  [3:0] op
);

parameter  ADD=0;
parameter  SUB=1;
parameter  AND=2;
parameter  OR=3;
parameter  XOR=4;
always @*
begin
    case(op)
        ADD: out = in0 + in1;
        SUB: out = in0 - in1;
        AND: out = in0 & in1;
        OR:  out = in0 | in1;
        XOR: out = in0 ^^ in1;

        default: out = in0;
    endcase
end
endmodule