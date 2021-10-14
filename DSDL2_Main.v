// welcome to the jungle
module top(
    input clock,
    input reset,    //Active high synchronous reset 
    input [15:0] value,
    input [3:0] dots,
    output [7:0] segment,
    output [7:0] digit );

    wire [1:0] dig_sel;
    wire [3:0] selected_value;
    wire[6:0] pattern;

    count12 count (.input(clock), .reset(reset), .dig_sel(dig_sel));
    digit_signal_generator choose_digit (.dig_sel(dig_sel),.digit(digit));
    group_selector group (.value(value),.dig_sel(dig_sel),.selected_value(selected_value));
    hex2seg hex2seg (.number(selected_value),.pattern(pattern));
    dot_adder add_dots (.pattern(pattern),.segment(segment));
endmodule