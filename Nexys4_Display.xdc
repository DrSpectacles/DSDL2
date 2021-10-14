## This file is a constraint file for the Nexys4 rev B board, for use in the
## display interface assignment.
## It only includes the signals needed in that assignment.

#==================================================================================

#These lines specify voltages used during configuration - see schematic
set_property CFGBVS VCCO [current_design]
set_property CONFIG_VOLTAGE 3.3 [current_design]

#==================================================================================

#This line specifies generation of a compressed bitstream, for faster configuration
set_property BITSTREAM.GENERAL.COMPRESS TRUE [current_design]

#==================================================================================

# Clock signal - from 100 MHz clock oscillator on the circuit board
#Bank = 35, Pin name = IO_L12P_T1_MRCC_35,					Sch name = CLK100MHZ
set_property PACKAGE_PIN E3 [get_ports clk100]
set_property IOSTANDARD LVCMOS33 [get_ports clk100]
create_clock -period 10.000 -name sys_clk_pin -waveform {0.000 5.000} -add [get_ports clk100]

#==================================================================================

# 7-segment display.  This is a multiplexed display, with 8 digits.
# Each digit has 8 segments (including a dot or decimal point), with a common anode.
# Segment cathode signals are common to all digits, and are active low.
# Signal name segment[7:0], with segment[7] = A, segment[6] = B, . . .
#			. . .	segment[1] = G, segment[0] = dot.
#Bank = 34, Pin name = IO_L2N_T0_34,						Sch name = CA
set_property PACKAGE_PIN L3 [get_ports {segment[7]}]
set_property IOSTANDARD LVCMOS33 [get_ports {segment[7]}]
#Bank = 34, Pin name = IO_L3N_T0_DQS_34,					Sch name = CB
set_property PACKAGE_PIN N1 [get_ports {segment[6]}]
set_property IOSTANDARD LVCMOS33 [get_ports {segment[6]}]
#Bank = 34, Pin name = IO_L6N_T0_VREF_34,					Sch name = CC
set_property PACKAGE_PIN L5 [get_ports {segment[5]}]
set_property IOSTANDARD LVCMOS33 [get_ports {segment[5]}]
#Bank = 34, Pin name = IO_L5N_T0_34,						Sch name = CD
set_property PACKAGE_PIN L4 [get_ports {segment[4]}]
set_property IOSTANDARD LVCMOS33 [get_ports {segment[4]}]
#Bank = 34, Pin name = IO_L2P_T0_34,						Sch name = CE
set_property PACKAGE_PIN K3 [get_ports {segment[3]}]
set_property IOSTANDARD LVCMOS33 [get_ports {segment[3]}]
#Bank = 34, Pin name = IO_L4N_T0_34,						Sch name = CF
set_property PACKAGE_PIN M2 [get_ports {segment[2]}]
set_property IOSTANDARD LVCMOS33 [get_ports {segment[2]}]
#Bank = 34, Pin name = IO_L6P_T0_34,						Sch name = CG
set_property PACKAGE_PIN L6 [get_ports {segment[1]}]
set_property IOSTANDARD LVCMOS33 [get_ports {segment[1]}]
#Bank = 34, Pin name = IO_L16P_T2_34,						Sch name = DP
set_property PACKAGE_PIN M4 [get_ports {segment[0]}]
set_property IOSTANDARD LVCMOS33 [get_ports {segment[0]}]

# These are the digit enable signals, also active low.
# Signal names are digit[7:0], digit[7] on the left, digit[0] on the right.
#Bank = 34, Pin name = IO_L18N_T2_34,						Sch name = AN0
set_property PACKAGE_PIN N6 [get_ports {digit[0]}]
set_property IOSTANDARD LVCMOS33 [get_ports {digit[0]}]
#Bank = 34, Pin name = IO_L18P_T2_34,						Sch name = AN1
set_property PACKAGE_PIN M6 [get_ports {digit[1]}]
set_property IOSTANDARD LVCMOS33 [get_ports {digit[1]}]
#Bank = 34, Pin name = IO_L4P_T0_34,						Sch name = AN2
set_property PACKAGE_PIN M3 [get_ports {digit[2]}]
set_property IOSTANDARD LVCMOS33 [get_ports {digit[2]}]
#Bank = 34, Pin name = IO_L13_T2_MRCC_34,					Sch name = AN3
set_property PACKAGE_PIN N5 [get_ports {digit[3]}]
set_property IOSTANDARD LVCMOS33 [get_ports {digit[3]}]
#Bank = 34, Pin name = IO_L3P_T0_DQS_34,					Sch name = AN4
set_property PACKAGE_PIN N2 [get_ports {digit[4]}]
set_property IOSTANDARD LVCMOS33 [get_ports {digit[4]}]
#Bank = 34, Pin name = IO_L16N_T2_34,						Sch name = AN5
set_property PACKAGE_PIN N4 [get_ports {digit[5]}]
set_property IOSTANDARD LVCMOS33 [get_ports {digit[5]}]
#Bank = 34, Pin name = IO_L1P_T0_34,						Sch name = AN6
set_property PACKAGE_PIN L1 [get_ports {digit[6]}]
set_property IOSTANDARD LVCMOS33 [get_ports {digit[6]}]
#Bank = 34, Pin name = IO_L1N_T034,							Sch name = AN7
set_property PACKAGE_PIN M1 [get_ports {digit[7]}]
set_property IOSTANDARD LVCMOS33 [get_ports {digit[7]}]

#==================================================================================

## Buttons - six pushbutton switches on the circuit board, only one used here
# This is the red button marked CPU RESET.  Signal is active low.
#Bank = 15, Pin name = IO_L3P_T0_DQS_AD1P_15,				Sch name = CPU_RESET
set_property PACKAGE_PIN C12 [get_ports rstPBn]
set_property IOSTANDARD LVCMOS33 [get_ports rstPBn]

#==================================================================================

## Switches - these are the 16 slide switches at the front edge of the board,
## only four are used here.
## Default signal names are sw[15] (on left) to sw[0] (on right).
## Switch up gives logic 1, switch down gives logic 0.
#Bank = 34, Pin name = IO_L21P_T3_DQS_34,					Sch name = SW0
set_property PACKAGE_PIN U9 [get_ports {swit[0]}]
set_property IOSTANDARD LVCMOS33 [get_ports {swit[0]}]
#Bank = 34, Pin name = IO_25_34,							Sch name = SW1
set_property PACKAGE_PIN U8 [get_ports {swit[1]}]
set_property IOSTANDARD LVCMOS33 [get_ports {swit[1]}]
#Bank = 34, Pin name = IO_L23P_T3_34,						Sch name = SW2
set_property PACKAGE_PIN R7 [get_ports {swit[2]}]
set_property IOSTANDARD LVCMOS33 [get_ports {swit[2]}]
#Bank = 34, Pin name = IO_L19P_T3_34,						Sch name = SW3
set_property PACKAGE_PIN R6 [get_ports {swit[3]}]
set_property IOSTANDARD LVCMOS33 [get_ports {swit[3]}]

#==================================================================================
