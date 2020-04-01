`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/31/2020 08:11:26 PM
// Design Name: 
// Module Name: register
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


module register #( parameter N=1)
    (
    input clk, rst, en,
    input [N-1:0] D,
    output reg [N-1:0] Q
    );
    
    
    always@(posedge clk, posedge rst)
begin
    if(rst)
        Q <= 0;
    else
    begin
        if (en)
        Q <= D;
        else
        begin
            Q <= Q;
        end
    end
end
endmodule
