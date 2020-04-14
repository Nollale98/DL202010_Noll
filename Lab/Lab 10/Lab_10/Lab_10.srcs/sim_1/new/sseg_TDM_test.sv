`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/10/2020 11:21:10 PM
// Design Name: 
// Module Name: sseg_TDM_test
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


module sseg_TDM_test();
reg [15:0] sw;
reg reset, clock;
reg [18:0] tmrcyc;
wire [6:0] seg;
wire [3:0] an;
wire dp;

assign tmrcyc= 19'b1000000000000000000;
sseg_TDM Disp (.sw(sw),.reset(reset),.clock(clock),.seg(seg),.an(an),.dp(dp));

    
    always  begin
    clock = ~clock; #(0.5);
    end
    
    initial  begin
        clock=0; sw=16'b000000001001001; reset =0; #(5*tmrcyc);
        reset = 1; #(4*tmrcyc);    
        reset = 0; #(6*tmrcyc);
        sw=16'b000000001011001;     #(4*tmrcyc);
        sw=16'b000000011001101;     #(6*tmrcyc);
        sw=16'b000000001100111;     #(4*tmrcyc);
        reset = 0; #(6*tmrcyc);
        reset = 1; #(4*tmrcyc);  
        sw=16'b000000101001101;     #(4*tmrcyc);  
        $finish;
    end

endmodule
