`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/03/2020 03:50:21 PM
// Design Name: 
// Module Name: sseg4
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


module sseg_TDM(
    input [15:0] sw,
    input reset, clock,
    output [3:0] an,
    output [6:0] seg,
    output dp);
    reg [15:0] data;
    reg hex_dec,sign;
    reg [10:0] bdata;
    wire [15:0] dec;
    wire [15:0] m1;
    wire [3:0] m2;
    wire [6:0] d1;
    wire N1;
    wire [3:0] w1, w2, w3, w4;
    wire [1:0] count;
    wire [17:0] Q;
    wire t,tick;
    
    assign data = {4'b0000, sw[11:0]};
    assign w1 = m1[3:0];
    assign w2 = m1[7:4];
    assign w3 = m1[11:8];
    assign w4 = m1[15:12];
    assign N1 = {sign & (~an[3])};
    assign dp = 1;
    assign bdata = sw[10:0];
    assign sign = sw[14];
    assign hex_dec = sw[15];
    
    BCD11 BCD(.number(bdata), .nout(dec));
    
    mux2 #(.N(16)) MUXA(.in0(data), .in1(dec), .sel(hex_dec), .out(m1));
    
    counter  #(.N(19)) timer (.clk(clock), .en(dp), .rst(reset), .count(Q), .tick(tick));
    
    counter  #(.N(2)) counter2 (.clk(tick), .en(dp), .rst(reset), .count(count), .tick(t));
    
    mux4 #(.N(4)) MUXB(.in0(w1), .in1(w2),.in2(w3), .in3(w4), .dig_sel(count), .out(m2));
    
    an_decode AN1(.dig_sel(count),.an(an));
    
    sseg_decoder SSEG1(.num(m2), .sseg(d1));
    
    mux2 #(.N(7)) MUXC(.in0(d1), .in1(7'b0111111), .sel(N1), .out(seg));
    
    
    
endmodule
