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
input [15:0]in,
output reg[10:0] display_out
);
reg [19:0]count=0;
reg [2:0] sel=0;
parameter T1MS=50000;
always@(posedge CLK)
begin
case(sel)
 0:
    case(in[15:12])
                0:display_out<=11'b0111_0000001;
                1:display_out<=11'b0111_1001111;
                2:display_out<=11'b0111_0010010;
                3:display_out<=11'b0111_0000110;
                4:display_out<=11'b0111_1001100;
                5:display_out<=11'b0111_0100100;
                6:display_out<=11'b0111_0100000;
                7:display_out<=11'b0111_0001111;
                8:display_out<=11'b0111_0000000;
                9:display_out<=11'b0111_0000100;
                10:display_out<=11'b0111_0001000;
                11:display_out<=11'b0111_1100000;
                12:display_out<=11'b0111_0110001;
                13:display_out<=11'b0111_1000010;
                14:display_out<=11'b0111_0110000;
                15:display_out<=11'b0111_0111000;
              endcase
1:
    case(in[11:8])
         0:display_out<=11'b1011_0000001;
                               1:display_out<=11'b1011_1001111;
                               2:display_out<=11'b1011_0010010;
                               3:display_out<=11'b1011_0000110;
                               4:display_out<=11'b1011_1001100;
                               5:display_out<=11'b1011_0100100;
                               6:display_out<=11'b1011_0100000;
                               7:display_out<=11'b1011_0001111;
                               8:display_out<=11'b1011_0000000;
                               9:display_out<=11'b1011_0000100;
                               10:display_out<=11'b1011_0001000;
                               11:display_out<=11'b1011_1100000;
                               12:display_out<=11'b1011_0110001;
                               13:display_out<=11'b1011_1000010;
                               14:display_out<=11'b1011_0110000;
                               15:display_out<=11'b1011_0111000;
                            endcase
           
2:
    case(in[7:4])
                 0:display_out<=11'b1101_0000001;
                               1:display_out<=11'b1101_1001111;
                               2:display_out<=11'b1101_0010010;
                               3:display_out<=11'b1101_0000110;
                               4:display_out<=11'b1101_1001100;
                               5:display_out<=11'b1101_0100100;
                               6:display_out<=11'b1101_0100000;
                               7:display_out<=11'b1101_0001111;
                               8:display_out<=11'b1101_0000000;
                               9:display_out<=11'b1101_0000100;
                               10:display_out<=11'b1101_0001000;
                               11:display_out<=11'b1101_1100000;
                               12:display_out<=11'b1101_0110001;
                               13:display_out<=11'b1101_1000010;
                               14:display_out<=11'b1101_0110000;
                               15:display_out<=11'b1101_0111000;
                            endcase
3:
    case(in[3:0])
                0:display_out<=11'b1110_0000001;
                                   1:display_out<=11'b1110_1001111;
                                   2:display_out<=11'b1110_0010010;
                                   3:display_out<=11'b1110_0000110;
                                   4:display_out<=11'b1110_1001100;
                                   5:display_out<=11'b1110_0100100;
                                   6:display_out<=11'b1110_0100000;
                                   7:display_out<=11'b1110_0001111;
                                   8:display_out<=11'b1110_0000000;
                                   9:display_out<=11'b1110_0000100;
                                   10:display_out<=11'b1110_0001000;
                                   11:display_out<=11'b1110_1100000;
                                   12:display_out<=11'b1110_0110001;
                                   13:display_out<=11'b1110_1000010;
                                   14:display_out<=11'b1110_0110000;
                                   15:display_out<=11'b1110_0111000;
                                endcase
default:display_out<=11'b1111_1111111;
endcase
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
