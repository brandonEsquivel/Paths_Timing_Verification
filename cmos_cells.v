
`timescale 1ns / 1ps

//Ejemplo #1
module BUF(A, Y);
input A;
output Y;
specify
	specparam tpd= 4.5; //hoja de fabricante 74ACT244
    (A*> Y) = (tpd, tpd); //tRise,tFall
endspecify
assign Y = A;
endmodule

//Ejemplo #2
module BUFX2 (A, Y);
input  A ;
output Y ;
   buf (Y, A);
   specify
     // delay parameters
     specparam
       tpllh = 0.13,
       tphhl = 0.15;
     // path delays
     (A *> Y) = (tpllh, tphhl);
   endspecify
endmodule


// Entrada A
// Salida Y
module NOT(A, Y);
endmodule

// Entrada A, B
// Salida Y
module NAND(A, B, Y);
endmodule

// Entrada A, B
// Salida Y
module NAND3(A, B, Y);
endmodule

// Entrada A, B
// Salida Y
module NOR(A, B, C, Y);
endmodule

// Entrada A, B
// Salida Y
module NOR3(A, B, C, Y);
endmodule

// Entrada D
// Reloj C
// Salida Q
module DFF(C, D, Q);
endmodule
