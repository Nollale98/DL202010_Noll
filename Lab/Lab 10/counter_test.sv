`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/09/2020 11:19:11 PM
// Design Name: 
// Module Name: counter_test
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


module counter_test();
    reg clk , en , rst;
    wire  [17:0] Q;
    wire tick;
    counter  #(.N(18)) r (.clk(clk),
    .en(en), .rst(rst), .count(Q), .tick(tick));
    
    always  begin
    clk = ~clk; #(0.5);
    end
    
    initial  begin
        clk=0; en=0;  rst =0; #3;
        rst = 1; #3;    
        en = 1; rst = 0; #6;
        en = 0;      #3;
        en = 1;      #6;
        en = 0;      #3;
        en = 1;      #(19'b1000000000000000001);
        $finish;
    end
endmodule
