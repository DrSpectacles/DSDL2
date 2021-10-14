// welcome to the jungle
//Block 1
module count12(input clock,
	       input  reset,
	       output reg [1:0] dig_sel
	       );
   
   reg [11:0]		  counter;
   wire			  pulse;
   

   
   always @ (posedge clock)
     begin
	if (reset) counter <= 12'd0;
	else
	  counter <= counter + 12'd1;
     end
   
   assign pulse = (counter == 12'd4095);

   always @ (posedge clock)
     begin
	if (reset) dig_sel <= 2'd0;
	else
	  if (pulse) dig_sel <= dig_sel + 2'd1;
	  else dig_sel <= dig_sel;
	
   
endmodule
   

