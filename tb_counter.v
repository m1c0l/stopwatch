`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   15:03:21 10/26/2016
// Design Name:   counter
// Module Name:   C:/Users/152/Desktop/blah/tb_counter.v
// Project Name:  blah
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: counter
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module tb_counter;

	// Inputs
	reg clk;
	reg rst;
    reg minutes_top_digit;
    reg minutes_bot_digit;
    reg seconds_top_digit;
    reg seconds_bot_digit;
	 reg is_minute_increasing,
	 is_second_increasing;

	// Instantiate the Unit Under Test (UUT)
	counter uut (
		.clk(clk), 
		.rst(rst),
        .minutes_top_digit(minutes_top_digit),
        .minutes_bot_digit(minutes_bot_digit),
        .seconds_top_digit(seconds_top_digit),
        .seconds_bot_digit(seconds_bot_digit),
		  .is_minute_increasing(is_minute_increasing),
		  .is_second_increasing(is_second_increasing)
	);

	initial begin
		// Initialize Inputs
		clk = 0;
		rst = 1;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here
        forever begin
            #10;
            rst = 0;
            
            clk = ~clk;
        end
	end
      
endmodule

