`timescale 1ns / 1ps
module TB_top;
	// Inputs to module being verified
	reg clock, reset;
	reg [15:0] value;
	reg [3:0] dots;
	// Outputs from module being verified
	wire [7:0] segment, digit;
	// Instantiate module
	top uut (
		.clock(clock),
		.reset(reset),
		.value(value),
		.dots(dots),
		.segment(segment),
		.digit(digit)
		);
	// Generate clock signal
	initial
		begin
			clock  = 1'b1;
			forever
				#100 clock  = ~clock ;
		end
	// Generate other input signals
	initial
		begin
			reset = 1'b0;
			value = 16'h0;
			dots = 4'b0;
			#150
			reset = 1'b1;
			#300
			reset = 1'b0;
			#1600
			value = 16'h1234;
			#2200
			dots = 4'b1000;
			#800
			value = 16'h0001;
			#200
			dots = 4'b0100;
			#1800
			value = 16'h0123;
			#400
			dots = 4'b0001;
			#600
			value = 16'h01234;
			#2200
			value = 16'h3456;
			#1400
			dots = 4'b0110;
			#700
			value = 16'h5678;
			#2400
			value = 16'h789a;
			#900
			value = 16'h89ab;
			#3000
			dots = 4'b1010;
			#300
			value = 16'hbcde;
			#1900
			value = 16'hdef0;
			#700
			value = 16'hef00;
			#1700
			value = 16'hf000;
			#1300
			dots = 4'b1111;
			#1100
			value = 16'h0000;
			#1800
			dots = 4'b0101;
			#2550
			$stop;
		end
endmodule
