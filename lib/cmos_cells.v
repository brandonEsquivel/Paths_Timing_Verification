`ifndef CMOS_CELLS
`define CMOS_CELLS

/* BRANDON ESQUIVEL MOLINA
University of COsta Rica
EIE, UCR
github: @brandonEsquivel
*/


// Describing the modules of the same cmos_cells.lib with timing & delays considerations

`timescale 1 ns / 1 ps

/* SPECIFY BLOCKS
The specify block describes paths across the module and assigns delays to those paths.
It performs also timing checks like setup and hold times.
The specify block is declared inside the module declaration.
The path declaration describes the path between the source and destination signal inside the module and assigns
the delays to this path. The path can be a simple path, edge sensitive path or state-dependent path. The path is
on the left-hand side of the statement and the delays are on the right-hand side. The delay values must be constant
expressions or specparams, and may be of the form min:typ:max.

specparam statements
Special parameters can be defined for use within the specify block.
They are declared using the specparam keyword. Instead of directly coding delays
into the specify block it is common to define specify parameters with specparam
then use these parameters to define the delays as before.
The specparam values are often useful for storing values for non simulation tools
such as delay calculators, and synthesis tools.

http://xilinx.info/_hdl/2/RESOURCES/www.ee.ed.ac.uk/~gerard/Teach/Verilog/me5cds/me95ahm.html
*/



// BUF = buffer
// Is a single-input single-output gate,
// similar to NOT, that copies its input
// value to its output. In diagram
// gate has the following shape -[>-
// Part: SN74LVC1G34 Single Buffer Gate
// Switching Characteristics, CL = 15 pF, Max tpd of 3.5 ns at 3.3 V
module BUF(A, Y);
	input A;
	output Y;
	specify
		specparam tpd = 3.5;
		(A => Y) = (3.5, 3.5);  // tRise,tFall
endspecify
assign Y = A;
endmodule


// Not gate or inversor
// Is a single-input single-output gate,
// opies its input value to its output with
// inversor. Shape -[>o-
// Part: SN74LVC1G04 Single Inverter Gate
// Switching Characteristics, CL = 15 pF, max tpd = 6.4
module NOT(A, Y);
specify
	specparam tpd= 6.4;
	(A*> Y) = (tpd, tpd);   // tRise,tFall
endspecify
input A;
output Y;
assign Y = ~A;
endmodule

// Not and = NAND
// NAND is the result of the negation
// of the AND operator. Where or means
// if two of the two inputs are HIGH
// output HIGH.
// Part: SN74LVC1G00 Single 2-Input Positive-NAND Gate
// Switching Characteristics, CL = 15 pF, Max tpd of 3.8 ns at 3.3 V
module NAND(A, B, Y);
specify
	specparam tpd = 3.8;
	(A,B*> Y) = (tpd, tpd);   // tRise,tFall
	endspecify
input A, B;
output Y;
assign Y = ~(A & B);
endmodule


// Not or = NOR
// NOR is the result of the negation
// of the OR operator. Where or means
// if one of the two inputs is HIGH
// output HIGH.
// Part: SN74AHC1G02-EP SINGLE 2-INPUT POSITIVE-NOR GATE
// Switching Characteristics, CL = 50 pF, Max tpd of 8.5 ns at 5 V, typical 7.7 ns
module NOR(A, B, Y);
specify
	specparam tpd = 7.7;
	(A,B*> Y) = (tpd, tpd);   // tRise,tFall
endspecify
input A, B;
output Y;
assign Y = ~(A | B);
endmodule




// Not and = NAND 3-inputs
// NAND is the result of the negation
// of the AND operator. Where or means
// if three of the three inputs are HIGH
// output HIGH.
// Part: 74LVC1G10 Single 3-Input Positive-NAND Gate
// Switching Characteristics, CL = 15 pF, Max tpd of 6.2 ns at 3.0 - 3.6 V, typ 5.0
module NAND3(A, B, C, Y);
specify
	specparam tpd = 5.0;
	(A,B,C*> Y) = (tpd, tpd);   // tRise,tFall
endspecify
input A, B, C;
output Y;
assign Y = ~(A & B & C);
endmodule



// Single 3-Input Positive-NOR Gate
// Not or = NOR
// NOR is the result of the negation
// of the OR operator. Where or means
// if one of the three inputs is HIGH
// output HIGH.
// Part: SN74LVC1G27 SINGLE 3-INPUT POSITIVE-NOR GATE
// Switching Characteristics, CL = 50 pF, Max tpd of 6.2 ns at 3.3 V typ 4.5
module NOR3(A, B, C, Y);
specify
	specparam tpd = 4.5;
	(A,B,C*> Y) = (tpd, tpd);   // tRise,tFall
endspecify
input A, B, C;
output Y;
assign Y = ~(A | B | C);
endmodule



// DFF =  D-type flip-flop = Data type flip-flop
// Flip Flop is a two-state (bi-stable) device, which serves as
// basic memory for sequential logic operations.
// part: SN74LVC1G80 Single Positive-Edge-Triggered D-Type Flip-Flop
// Timing Requirements: TA = –40°C to +85°C
//  Using the maximun values for all parameters, maximum tpd of 4.2 ns at 3.3 V
module DFF(C, D, Q);
specify
	specparam tpd = 4.2;
	specparam thold = 0.9;
	specparam tsetup = 2.5;
	(C,D => Q) = (tpd, tpd);   // tRise,tFall
	$setup(D, posedge C, tsetup);
 	$hold(posedge C, D, thold);
endspecify

input C, D;
output reg Q;
always @(posedge C)
	Q <= D;
endmodule

`endif