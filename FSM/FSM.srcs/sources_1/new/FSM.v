`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/10/09 19:50:20
// Design Name: 
// Module Name: FSM
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


module FSM(
input clk,
input in,
output reg vaild
    
    );
    reg [3:0]ch = 4'b0000;
    localparam a = 11;//,b = 1,c=2,d=3,e=4,f=5,g = 6,h = 7,i = 8,j=9,k=10,l =11,m=12,n=13,o=14,p =15;
    always@(posedge clk)begin
        ch = ch>>1;
        ch[3] = in;
        vaild = 0;
        case(ch)
            a:vaild <= 1;
            default:vaild = 0;
        endcase
    end
        
        
    
endmodule
