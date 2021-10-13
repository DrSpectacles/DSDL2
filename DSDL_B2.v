// welcome to the jungle

module digit_signal_generator(input [1:0] input;
			      output [3:0] digit;
			      );

   always @ (input)
     case (input)
       2'b00: digit = 4'b1110;
       2'b01: digit = 4'b1101;
       2'b10: digit = 4'b1011;
       2'b11: digit = 4'b0111;
	
     endcase // case (input)


endmodule
