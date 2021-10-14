// welcome to the jungle
//Block 2
module digit_signal_generator(input [1:0] dig_sel,
			      output reg [3:0] digit
			      );

   always @ (dig_sel)
     case (dig_sel)
       2'b00: digit = 4'b1110;
       2'b01: digit = 4'b1101;
       2'b10: digit = 4'b1011;
       2'b11: digit = 4'b0111;
	
     endcase // case (dig_sel)


endmodule
