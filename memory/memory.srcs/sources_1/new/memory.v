`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/10/30 20:19:17
// Design Name: 
// Module Name: memory
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


module memory(
input CLK,
input [7:0] sw,
output wire[10:0] display_out
    );
    wire [31:0]data;
    Ins_Rom your_instance_name (
      .clka(CLK),    // input wire clka
      .addra(sw),  // input wire [7 : 0] addra
      .douta(data)  // output wire [31 : 0] douta
    );
    wire [15:0]test = 16'b0001000100010001;
    display_7seg display(
        .CLK(CLK),
        .in(data[15:0]),
        .display_out(display_out)
        );
    
endmodule
