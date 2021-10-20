// welcome to the jungle
//Block 2
module digit_signal_generator(input [1:0] dig_sel,
                              output reg [7:0] digit
			      );

   always @ (dig_sel)
     case (dig_sel)
       2'b00: digit = 8'b11111110;
       2'b01: digit = 8'b11111101;
       2'b10: digit = 8'b11111011;
       2'b11: digit = 8'b11110111;
	
     endcase // case (dig_sel)


endmodule