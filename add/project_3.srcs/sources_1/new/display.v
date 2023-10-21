`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/09/25 19:41:34
// Design Name: 
// Module Name: display
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


module display(
input [8:0]sum,
input clk,
input reset,
output reg[10:0]display_out,
output reg overflow
    
    );
        reg[19:0]count = 0;
        wire [7:0] S;
        reg [1:0]sel = 0;
        parameter TIMS = 50000;
        assign S = sum[7:0];
        always@(posedge clk)begin
           case(sel)
            0:
             case(S[7:4])
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
                case(S[3:0])
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
             endcase
            if(sum[8] == 1)begin
            overflow <= 1;
            end
            else begin
            overflow <= 0;

            end
      end
      always@(posedge clk)begin
      if(!reset)begin
      count <= 0;
      end
      count<= count+1;
      if(count ==TIMS)begin
        sel <= sel+1;
        if(sel ==2)begin
        sel <= 0;
        end
        count<=0;
      end
      end
  endmodule
