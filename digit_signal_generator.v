
//Block 2
// Signal to enable or disable each digit of the display

module digit_signal_generator(input [1:0] dig_sel,
                              output reg [7:0] digit
			      );

   always @ (dig_sel)
	   case (dig_sel) // Designed for an 8 digit display with only 4 used
       2'b00: digit = 8'b11111110;
       2'b01: digit = 8'b11111101;
       2'b10: digit = 8'b11111011;
       2'b11: digit = 8'b11110111;
	
     endcase // case (dig_sel)


endmodule
