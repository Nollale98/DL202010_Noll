`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/23/2020 02:11:44 AM
// Design Name: 
// Module Name: Game_Test
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


module Game_Test();

reg btnU,btnL,btnR,btnC,btnD,clk;
reg [15:0] sw;
wire [6:0] seg;
wire [3:0] an;
wire [15:0] led;
wire dp;


guessing_game GameTest(.clk(clk),.btnC(btnC),.btnL(btnL),.btnR(btnR),.btnD(btnD),.sw(sw),.seg(seg),.an(an),.led(led),.dp(dp));

always 
begin
    #1 clk = ~clk;
end
   


    initial begin
        clk=0; btnC=0; btnU=0; btnL=0; btnR=0; btnD=0; sw=16'b0000000000000000; #10;
        btnC=1; #15;
        btnC=0; #15;
        btnR=1; #25;
        btnR=0; #15;
        btnL=1; #15;
        btnL=0; #15;
        btnD=1; btnU=1; #15;
        btnD=0; btnU=0; #15;
        btnL=1; #2;
        btnL=0; #8;
        $finish;
        end

endmodule
