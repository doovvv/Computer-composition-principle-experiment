`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/08/30 19:30:28
// Design Name: 
// Module Name: display_7seg
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


module display_7seg(
input CLK,
input SW_in,
output reg[10:0] display_out
);
reg [19:0]count=0;
reg [2:0] sel=0;
parameter T1MS=50000;
always@(posedge CLK)
begin
if(SW_in==0)
begin
case(sel)
0:display_out<=11'b0111_1001111;
1:display_out<=11'b1011_0010010;
2:display_out<=11'b1101_0000110;
3:display_out<=11'b1110_1001100;
default:display_out<=11'b1111_1111111;
endcase
end
else
begin
case(sel)
0:display_out<=11'b1110_1001111;
1:display_out<=11'b1101_0010010;
2:display_out<=11'b1011_0000110;
3:display_out<=11'b0111_1001100;
default:display_out<=11'b1111_1111111;
endcase
end
end
always@(posedge CLK)
begin
count<=count+1;
if(count==T1MS)
begin
count<=0;
sel<=sel+1;
if(sel==4)
sel<=0;
end
end
endmodule
