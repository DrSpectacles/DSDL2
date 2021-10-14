module dot_adder(
		 input [6:0]  pattern,
		 input [3:0]  dots,
		 input [2:0]  dig_sel,
		 output [7:0] segments
		 
		 );
   
   always @ (pattern, dots, dig_sel)
     case (dig_sel)
       
       2'b00: output = { pattern[6:0], dots[0] };

       2'b01: output = { pattern[6:0], dots[1] };
       
       2'b10: output = { pattern[6:0], dots[2] };
       
       2'b11: output = { pattern[6:0], dots[3] };
       
       

     endcase (dig_sel); // case (dig_sel)

endmodule
