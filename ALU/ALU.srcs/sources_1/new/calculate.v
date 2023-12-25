`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2015/09/24 16:59:00
// Design Name: 
// Module Name: calculate
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


module calculate(
    input  [31:0] Sign_extend,
    input [31:0] num2,
    input  [2:0] op,
    output reg [31:0] result
    );
   // wire [31:0] num2 = 32'h01;
//    wire [31:0] Sign_extend;
  //assign  Sign_extend[6:0] = num1;
   //assign Sign_extend[31:7] = num1[7];
    always@(*) begin
    case(op)
    0:
        result = num2+Sign_extend;
    1:
        result = num2-Sign_extend;
    2:
        result = num2 & Sign_extend;
    3:
        result = num2|Sign_extend;
    4:
        result = ~Sign_extend;
    5:
        result = Sign_extend<num2? 1:0;
    endcase
    end
        
     
endmodule
