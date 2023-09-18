`timescale 1s / 1ms
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/09/04 19:56:31
// Design Name: 
// Module Name: led_16
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


module led_16(
    input  CLK,
    input  SW_in,
    input  reset,
    output reg[15:0] led
    );

        
        
    reg[15:0]current_state;
    reg check;
     reg [27:0] cnt ;//定义一个28位的寄存器，用来存数，目标一秒变化一次，则需要计数到50M，对应一个28位的二进制数
    wire add_cnt ;//计数标志位
    wire end_cnt ;//清零计数标志位
   
    assign add_cnt = 1; 
    assign end_cnt = add_cnt && cnt== 50000000 - 1; //只有当cnt=50M-1时，及计数时间已经到1S时，end_cnt才为1
   
    /*---计数器功能实现---*/
    always @(posedge CLK)begin//当时钟上升沿或者复位信号下降沿时执行
   
    if(reset)begin
       cnt <= 'd0;
    end//检测到复位信号，计数器值归零
   
    else if(add_cnt)begin//恒成立
        if(end_cnt)
        cnt <= 'd0;//计数到目标值时归零
        else
        cnt <= cnt + 1'b1;//正常加一计数
       end
   end
    always@(posedge CLK )begin
        if(reset)begin
            led <= 16'b1000000000000000;
            check = 1'b1;
        end else if(SW_in && end_cnt) begin
                led <= check?led>>1: led>>1;
        end    else if(end_cnt) begin 
                led<= check? led<<1:led<<1;
         end else begin
            led<=led;
         end
        if(led == 16'b1000000000000000) begin
            check = 1'b1;
        end else if(led == 16'b0000000000000001)begin
            check = 1'b0;
        end
    end
endmodule
