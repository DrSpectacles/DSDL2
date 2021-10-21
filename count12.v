// Block 1
// Module to generate signal that will select a digit
// and switch digits at ~1.2kHz

module count12(input clock,
	       input  reset,
	       output reg [1:0] dig_sel // 2 bit output
	       );
   
	reg [11:0]		  counter;
	// a 12 bit counter was chosen to get an appropriate
	// display refresh rate
        wire			  pulse; 
   
   always @ (posedge clock)
     begin
	if (reset) counter <= 12'd0; //synchronous reset	
	else	
	  counter <= counter + 12'd1; //advance count
     end
	assign pulse = (counter == 12'd4095); 
	// pulse is sent out at end of 12 bit count

	
	always @ (posedge clock) //2 bit counter   
     begin
	if (reset) dig_sel <= 2'd0;
	else
	if (pulse) dig_sel <= dig_sel + 2'd1; //only advance when pulse high
	  else dig_sel <= dig_sel;
     end
	
   
endmodule
   
