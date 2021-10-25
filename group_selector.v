// Block 3
// Module to select one 4 bit group from the input

module group_selector(input [15:0] value,
		      input [1:0]  dig_sel,
		      output reg [3:0] selected_value
                     );

  always @ (dig_sel, value)
    case (dig_sel)
      2'b00: selected_value = value[3:0];
      
      2'b01: selected_value = value[7:4];
      
      2'b10: selected_value = value[11:8];
      
      2'b11: selected_value = value[15:12];
      
    endcase // case (dig_sel)

endmodule
      


