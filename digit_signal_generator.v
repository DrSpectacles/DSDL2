// welcome to the jungle
//Block 2
module digit_signal_generator(input [1:0] dig_sel,
                              output reg [7:0] digit
			      );

   always @ (dig_sel)
     case (dig_sel)
       2'b00: digit = 7'b00001110;
       2'b01: digit = 7'b00001101;
       2'b10: digit = 7'b00001011;
       2'b11: digit = 7'b00000111;
	
     endcase // case (dig_sel)


endmodule