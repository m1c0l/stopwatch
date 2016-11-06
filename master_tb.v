`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   16:16:11 11/05/2016
// Design Name:   master_control
// Module Name:   /home/michael/Documents/random-projects/stopwatch/master_tb.v
// Project Name:  blah
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: master_control
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module master_tb;

	// Inputs
	reg clk;
	reg sw, rst;
	reg [7:0] seg;
	reg [3:0] an;

	// Instantiate the Unit Under Test (UUT)
	master_control uut (
		.clk(clk), 
		.sw(sw), 
		.rst(rst),
		.seg(seg), 
		.an(an)
	);

	initial begin
		// Initialize Inputs
		clk = 0;
		sw = 0;
		seg = 0;
		an = 0;
		rst = 1;

		// Wait 100 ns for global reset to finish
		#100;
		forever begin
            #10;
            rst = 0;
            
            clk = ~clk;
		end
		
        
		// Add stimulus here

	end
      
endmodule

