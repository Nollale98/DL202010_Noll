`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/22/2020 08:13:07 PM
// Design Name: 
// Module Name: guess_FSM
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


module guess_FSM(
    input [3:0] b,
    input clk, reset,
    output reg [3:0] y,
    output reg win, reg lose);
    
reg [2:0] present_state, next_state;
reg [3:0] y0,y1,y2,y3;

assign y0=4'b0001;
assign y1=4'b0010;
assign y2=4'b0100;
assign y3=4'b1000;
    
parameter S0=3'b000;
parameter S1=3'b001;
parameter S2=3'b010;
parameter S3=3'b011;
parameter Swin=3'b100;
parameter Slose=3'b101;


always @(posedge clk)

begin
    case(present_state)
        S0: 
        begin
            if (b[3]||b[2]||b[1])
                next_state=Slose;
            else if (~b[3]&&~b[2]&&~b[1]&&b[0])
                next_state=Swin;
            else
                next_state=S1;
        end
        S1:
        begin
            if (b[3]||b[2]||b[0])
                next_state=Slose;
            else if (~b[3]&&~b[2]&&b[1]&&~b[0])
                next_state=Swin;
            else
                next_state=S2;
        end
        S2:
        begin
            if (b[3]||b[0]||b[1])
                next_state=Slose;
            else if (~b[3]&&b[2]&&~b[1]&&~b[0])
                next_state=Swin;
            else
                next_state=S3;
        end
        S3:
        begin
            if (b[0]||b[2]||b[1])
                next_state=Slose;
            else if (b[3]&&~b[2]&&~b[1]&&~b[0])
                next_state=Swin;
            else
                next_state=S0;
        end
        Swin:
        begin
            if (b[3]||b[2]||b[1]||b[0])
                next_state=Swin;
            else
                next_state=S0;
        end
        Slose:
        begin
            if (b[3]||b[2]||b[1]||b[0])
                next_state=Slose;
            else
                next_state=S0;
        end
    endcase
    
end




always @(posedge clk, posedge reset)
begin
    if (reset == 1'b1)
        begin
        present_state=S0;
        win=0;
        lose=0;
        end
    else
    begin
        present_state = next_state;
        begin
    if (present_state==S0)
        begin
        y<=y0;
        win=1'b0;
        lose=1'b0;
        end
    else if (present_state==S1)
        y<=y1;
    else if (present_state==S2)
        y<=y2;
    else if (present_state==S3)
        y<=y3;
    else if (present_state==Swin)
        begin
        win=1;
        next_state=present_state;
        end
    else if (present_state==Slose)
        begin
        lose=1;
        next_state=present_state;
        end
    end
    end
end


endmodule
