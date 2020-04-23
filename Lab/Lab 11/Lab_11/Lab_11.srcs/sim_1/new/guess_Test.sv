`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/22/2020 09:45:26 PM
// Design Name: 
// Module Name: guess_Test
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


module guess_Test();

reg clk, rst;
reg [3:0] b;
wire win, lose;
wire [3:0] y;

guess_FSM GuessTest(.clk(clk),.reset(rst),.b(b),.win(win),.lose(lose),.y(y));

always 
begin
    #1 clk = ~clk;
end
   


    initial begin
        clk=0; rst=0; b=4'b0000; #5;
        rst=1; #10;
        rst=0; #5;
        b=4'b0010; #5;
        b=4'b0000; #5;
        b=4'b1000; #5;
        b=4'b0000; #5;
        b=4'b0110; #5;
        b=4'b0000; #5;
        b=4'b0100; #5;
        $finish;
        end
endmodule 

