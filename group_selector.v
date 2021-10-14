//yo
//Block 3
module group_selector(input [15:0] value,
		      input [1:0]  dig_sel,
                      
		      output reg [3:0] selected_value

		      )

  always @ (dig_sel, value)
    case (dig_sel)
      2'b00: selected_value = value[3:0];
      
      2'b01: selected_value = value[4:7];
      
      2'b10: selected_value = value[8:11];
      
      2'b11: selected_value = value[12:15];
      
    endcase; // case (dig_sel)

endmodule
      
