
//Block 5 
// Module to add the dot to the display signal

module dot_adder(	
		 input [6:0]  pattern,
		 input [3:0]  dots,
  		 input [1:0]  dig_sel,
  	     	 output reg [7:0] segments 
		 );		
   
  always @ (dig_sel, pattern, dots) 
     case (dig_sel)
       
	     2'b00: segments = { pattern, !(dots[0]) };  // dot sigal needs to be inverted before adding

       2'b01: segments = { pattern, !(dots[1]) };
       
       2'b10: segments = { pattern, !(dots[2]) };
       
       2'b11: segments = { pattern, !(dots[3]) };
       
     endcase // case (dig_sel)

endmodule

