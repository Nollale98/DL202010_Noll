`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/23/2020 12:09:08 AM
// Design Name: 
// Module Name: guessing_game
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


module guessing_game(
    input btnU, btnL, btnR, btnC, btnD, clk,
    input [15:0] sw,
    output reg [6:0] seg,
    output reg [3:0] an,
    output reg [15:0] led,
    output reg dp);
    
    reg [3:0] b; reg [3:0] y; reg [22:0] Cclk; reg [4:0] tick;
    reg win, lose, Gclk, reset, Mode;
    
    assign dp=1;
    assign reset=btnC;
    assign Mode=sw[0];
    assign an=4'b0111;
    
    debounce #(.N(1)) debU (.clk(clk), .reset(reset), .in(btnU), .out(b[0]),
        .tick(tick[0]));
    debounce #(.N(1)) debL (.clk(clk), .reset(reset), .in(btnL), .out(b[1]),
        .tick(tick[1]));
    debounce #(.N(1)) debR (.clk(clk), .reset(reset), .in(btnR), .out(b[2]),
        .tick(tick[2]));
    debounce #(.N(1)) debD (.clk(clk), .reset(reset), .in(btnD), .out(b[3]),
        .tick(tick[3]));
    
    counter  #(.N(23)) EasyMode (.clk(clk), .en(dp), .rst(reset), .count(Cclk), .tick(tick[4]));
    
    parameter in0=0;
    parameter in1=1;
    parameter in2=4'b0010;
    parameter in3=4'b0100;
    parameter in4=4'b1000;
    
    always @*
    begin
        case(Mode)
            default: Gclk=clk;
            in1: Gclk=tick[4];
        endcase
    end
    
guess_FSM GuessGame(.clk(Gclk),.reset(reset),.b(b),.win(win),.lose(lose),.y(y));

    always @(posedge Gclk)
    begin
        case(y)
        in1: seg=7'b1111110;
        in2: seg=7'b1011111;
        in3: seg=7'b1111101;
        in4: seg=7'b0111111;
        endcase
    end
    
    always @(posedge Gclk)
    begin
        if (win==0&&lose==1)
            led=16'b0000000000000001;
        else if (lose==0&&win==1)
            led=16'b1111111111111110;
        else
            led=16'b0000000000000000;
    end
endmodule
