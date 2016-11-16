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
     input [9:0] jstkPosX,
     input [9:0] jstkPosY,
    output reg[3:0] minutes_top_digit,
    output reg[3:0] minutes_bot_digit,
    output reg[3:0] seconds_top_digit,
    output reg[3:0] seconds_bot_digit
    );
    
	 initial minutes_top_digit <= 0;
	 initial minutes_bot_digit <= 0;
	 initial seconds_top_digit <= 0;
	 initial seconds_bot_digit <= 0;
     reg is_running = 0;
     reg is_fwd_or_bkwd = 1; // 1 = forward, 0 = backward
     
     reg clk_used;
     
     always @(posedge clk) begin
        
        if (adj == 1) begin
            clk_used <= clk_2hz;
        end
        else begin
            clk_used <= clk_1hz;
        end
        if (pause) begin
            is_running <= ~is_running;
        end
        else if (jstkPosX >= 'd900) begin
            //adj = 1;
            //clk_used = clk_2hz;
            //minutes_top_digit <= 'd9;
            is_running <= 1;
            is_fwd_or_bkwd <= 1;
        end
        else if (jstkPosX <= 'd150) begin
            is_running <= 1;
            is_fwd_or_bkwd <= 0;
        end
      end
     
     /*always @() begin
        
     end*/
    
    always @ (posedge clk_used) begin
        if (rst) begin
            minutes_top_digit <= 0;
            minutes_bot_digit <= 0;
            seconds_top_digit <= 0;
            seconds_bot_digit <= 0;
        end
        else if (is_running && is_fwd_or_bkwd) begin
        // if running and counting forward
            if (adj == 0 || (adj == 1 && sel == 1)) begin
            // seconds control
                seconds_bot_digit <= seconds_bot_digit + 1;
                // if we reach 9 seconds
                if (seconds_bot_digit == 'd9) begin
                    seconds_bot_digit <= 0;
                    seconds_top_digit <= seconds_top_digit + 1;
                end
                // if we reach 59 seconds
                if (seconds_top_digit == 'd5 && seconds_bot_digit == 'd9) begin
                    seconds_top_digit <= 0;
                    minutes_bot_digit <= minutes_bot_digit + 1;
                end
            end
            
            // if adjust = 1, always increase minutes
            if (adj == 1 && sel == 0) begin
                minutes_bot_digit <= minutes_bot_digit + 1;
            end
            if (adj == 0 || (adj == 1 && sel == 0)) begin
            // if at 9 minutes
                if (minutes_bot_digit == 'd9) begin
                    minutes_bot_digit <= 0;
                    minutes_top_digit <= minutes_top_digit + 1;
                end
                if (minutes_top_digit == 'd9 && minutes_bot_digit == 'd9) begin
                    minutes_top_digit <= 0;
                end
            end
        end
        
        else if (is_running && !is_fwd_or_bkwd) begin
        // if running and counting backward
            if (adj == 0 || (adj == 1 && sel == 1)) begin
                seconds_bot_digit <= seconds_bot_digit - 1;
                if (seconds_bot_digit == 'd0) begin
                    seconds_bot_digit <= 9;
                    seconds_top_digit <= seconds_top_digit - 1;
                end
                if (seconds_top_digit == 'd0 && seconds_bot_digit == 'd0) begin
                    seconds_top_digit <= 5;
                    seconds_bot_digit <= 9;
                    if (minutes_bot_digit) begin
                        minutes_bot_digit <= minutes_bot_digit - 1;
                    end
                    else begin
                        minutes_top_digit <= minutes_top_digit - 1;
                        minutes_bot_digit <= 0;
                    end
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
