`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/25/2020 03:53:00 PM
// Design Name: 
// Module Name: BCD11
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


module BCD11(input [10:0] number, output [15:0] nout );

    reg [3:0] temp1;
        wire [3:0] c1, c2, c3, c4, c5, c6;
        wire [3:0] c7, c8, c9, c10, c11, c12, c13, c14, c15;
       
       assign temp1 = {1'b0,number[10:8]};
       
        add3 ADD1(.num(temp1),.result(c1));
        
        add3 ADD2(.num({c1[2:0],number[7]}),.result(c2));
        
        add3 ADD3(.num({c2[2:0],number[6]}),.result(c3));
        
        add3 ADD4(.num({c3[2:0],number[5]}),.result(c4));
        
        add3 ADD5(.num({c4[2:0],number[4]}),.result(c5));
        
        add3 ADD6(.num({c5[2:0],number[3]}),.result(c6));
        
        add3 ADD7(.num({c6[2:0],number[2]}),.result(c7));
        
        add3 ADD8(.num({c7[2:0],number[1]}),.result(c8));
        
        add3 ADD9(.num({1'b0,c1[3],c2[3],c3[3]}),.result(c9));
        
        add3 ADD10(.num({c9[2:0],c4[3]}),.result(c10));
        
        add3 ADD11(.num({c10[2:0],c5[3]}),.result(c11));
        
        add3 ADD12(.num({c11[2:0],c6[3]}),.result(c12));
        
        add3 ADD13(.num({c12[2:0],c7[3]}),.result(c13));
        
        add3 ADD14(.num({1'b0,c9[3],c10[3],c11[3]}),.result(c14));
        
        add3 ADD15(.num({c14[2:0],c12[3]}),.result(c15));
        
        assign nout = {2'b00,c14[3],c15[3],c15[2:0],c13[3],c13[2:0],c8[3],c8[2:0],number[0]};

endmodule
