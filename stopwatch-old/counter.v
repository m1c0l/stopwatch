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
    input clk,
    input clk_1hz,
	 input clk_2hz,
	 input clk_fast,
    input rst,
	 input pause,
	 input adj,
	 input sel,
    output reg[3:0] minutes_top_digit,
    output reg[3:0] minutes_bot_digit,
    output reg[3:0] seconds_top_digit,
    output reg[3:0] seconds_bot_digit
    );
    
	 initial minutes_top_digit <= 0;
	 initial minutes_bot_digit <= 0;
	 initial seconds_top_digit <= 0;
	 initial seconds_bot_digit <= 0;
     reg is_running = 1;
     
     reg clk_used;
     always @(*) begin
        
        if (adj == 1) begin
            clk_used = clk_2hz;
        end
        else begin
            clk_used = clk_1hz;
        end
      end
     
     always @(posedge clk) begin
        if (pause)
            is_running <= ~is_running;
     end
    
    always @ (posedge clk_used) begin
        if (rst) begin
            minutes_top_digit <= 0;
            minutes_bot_digit <= 0;
            seconds_top_digit <= 0;
            seconds_bot_digit <= 0;
        end
        else if (is_running) begin
            if (adj == 0 || (adj == 1 && sel == 1)) begin
                seconds_bot_digit <= seconds_bot_digit + 1;
                if (seconds_bot_digit == 'd9) begin
                    seconds_bot_digit <= 0;
                    seconds_top_digit <= seconds_top_digit + 1;
                end
                if (seconds_top_digit == 'd5 && seconds_bot_digit == 'd9) begin
                    seconds_top_digit <= 0;
                    minutes_bot_digit <= minutes_bot_digit + 1;
                end
            end
            
            if (adj == 1 && sel == 0) begin
                minutes_bot_digit <= minutes_bot_digit + 1;
            end
            if (adj == 0 || (adj == 1 && sel == 0)) begin
                if (minutes_bot_digit == 'd9) begin
                    minutes_bot_digit <= 0;
                    minutes_top_digit <= minutes_top_digit + 1;
                end
                if (minutes_top_digit == 'd9 && minutes_bot_digit == 'd9) begin
                    minutes_top_digit <= 0;
                end
            end
        end
        
        
    end

endmodule
