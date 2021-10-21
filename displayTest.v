//////////////////////////////////////////////////////////////////////////////////
// Company:       UCD School of Electrical and Electronic Engineering
// Engineer:      Brian Mulkeen
// Project:       Display Interface Design
// Target Device: XC7A100T-csg324 on Digilent Nexys-4 board
// Description:   Top-level module to act as test hardware for display interface.
//                Defines top-level input and output signals (see comments on ports).
//                Instantiates clock and reset generator block, for 5 MHz clock.
//                Should instantiate the display interface to be tested.
//  Created: 8 October 2016
//  Modified: 11 October 2019 - new signal name and comments.
//  Modified: 16 October 2020 - added switch input to control dots
//////////////////////////////////////////////////////////////////////////////////
module displayTest(
        input clk100,        // 100 MHz clock from oscillator on circuit board
        input rstPBn,        // reset signal, active low, from CPU RESET pushbutton
        input [3:0] swit,    // connects to 4 switches on the circuit board
        output [7:0] digit,  // digit controls - active low (7 on left, 0 on right)
        output [7:0] segment // segment controls - active low (a b c d e f g p)
        );

// ===========================================================================
// Interconnecting Signals
    wire clk5;              // 5 MHz clock signal, buffered
    wire rstInt;            // internal reset signal, active high
    wire [15:0] dispVal;    // value to be displayed

// ===========================================================================
// Instantiate clock and reset generator, connect to signals
    clockReset  clkGen  (
            .clk100 (clk100),       // input clock at 100 MHz
            .rstPBn (rstPBn),       // input reset, active low
            .clk5   (clk5),         // output clock, 5 MHz
            .reset  (rstInt) );     // output reset, active high

//=====================================================================================
// This hardware generates a test input for the display block, using a 28-bit counter.

// 29-bit counter, clocked at 5 MHz, overflows every 107 seconds (approx).
   reg [28:0] testCount;      // 29-bit counter
   always @ (posedge clk5)
      begin
         if (rstInt) testCount <= 29'b0;
         else testCount <= testCount + 1'b1;
      end

// Take selected bits from the counter to build the value to be displayed, using
// overlapping groups of bits from the counter for each hexadecimal digit.
// This allows each digit to change at a different rate, slow enough to be checked easily,
// but fast enough to cycle through all 16 symbols in a reasonable time.  
   assign dispVal[15:12] = testCount[28:25]; // left digit changes every 6.7 s (approx)
   assign dispVal[11:8]  = testCount[27:24]; // changes every 3.4 s (approx)
   assign dispVal[7:4]   = testCount[26:23]; // changes every 1.7 s (approx)
   assign dispVal[3:0]   = testCount[25:22]; // right digit changes every 0.84 s (approx)


// ==================================================================================
/* Instantiate your display interface here.  Connect its clock input to the 5 MHz clock 
	signal, clk5, and its reset input to the internal reset signal, rstInt.  
	The value to be displayed is in the dispVal signal, as generated above.
	The signal to control the dots is called swit.
	The segment output of your module connects to the segment signal.
	The digit output of your module connects to the digit signal.  */

    top top(.clock(clk5),.reset(rstInt),.value(dispVal),.dots(swit),.segment(segment),.digit(digit) );
     
endmodule
