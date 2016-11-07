`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:34:35 10/26/2016 
// Design Name: 
// Module Name:    counter 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module counter(
    input clk_1hz,
	 input clk_2hz,
	 input clk_fast,
    input rst,
	 input pause,
	 input adj,
	 input sel,
    //is_minute_increasing,
    //is_second_increasing,
    output reg[3:0] minutes_top_digit,
    output reg[3:0] minutes_bot_digit,
    output reg[3:0] seconds_top_digit,
    output reg[3:0] seconds_bot_digit
    );
    
    //input clk, rst;
    //input is_minute_increasing,
    //is_second_increasing;
    //reg [6:0] minutes;
    //reg [5:0] seconds;
    //output reg [3:0] minutes_top_digit = 0;
    //output reg [3:0] minutes_bot_digit = 0;
    //output reg [3:0] seconds_top_digit = 0;
    //output reg [3:0] seconds_bot_digit = 0;
    
    //wire clk_1hz, clk_2hz, clk_fast, clk_blink;
    
    //clock clock1(.clk(clk), .rst(rst), 
    //    .clk_1hz(clk_1hz), .clk_2hz(clk_2hz), .clk_fast(clk_fast),
    //    .clk_blink(clk_blink));
	 initial minutes_top_digit <= 0;
	 initial minutes_bot_digit <= 0;
	 initial seconds_top_digit <= 0;
	 initial seconds_bot_digit <= 0;
    
    always @ (posedge clk_fast) begin
        if (rst) begin
            minutes_top_digit <= 0;
            minutes_bot_digit <= 0;
            seconds_top_digit <= 0;
            seconds_bot_digit <= 0;
        end
        else begin
            seconds_bot_digit <= seconds_bot_digit + 1;
        end
        if (seconds_bot_digit == 'd9) begin
            seconds_bot_digit <= 0;
            seconds_top_digit <= seconds_top_digit + 1;
        end
        if (seconds_top_digit == 6) begin
            seconds_top_digit <= 0;
            minutes_bot_digit <= minutes_bot_digit + 1;
        end
        if (minutes_bot_digit == 'd9) begin
            minutes_bot_digit <= 0;
            minutes_top_digit <= minutes_top_digit + 1;
        end
        if (minutes_top_digit == 'd10) begin
            minutes_top_digit <= 0;
        end
        
    end

endmodule
