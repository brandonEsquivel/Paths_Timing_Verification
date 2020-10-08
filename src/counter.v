/*	Brandon Esquive Molina
	brandon.esquivel@ucr.ac.cr
   Counter module with 4-modes operation
*/

`ifndef COUNTER
`define COUNTER

`timescale 1 ns / 1 ps

module contador(
  // inputs
  input wire ENABLE, RESET, clk,
  input wire [3:0]  D,
  input wire [1:0]  MODO,
  //outputs
  output reg [3:0]    Q,
  output reg  RCO,  LOAD

);


reg [1:0] MODO_reg;

  // saving actual state of operation mode
  always@(*) begin
    MODO_reg =  MODO;
  end




  always @(posedge clk) begin
    if (RESET) begin
       Q <= 0;
       LOAD <= 0;
       RCO <= 0;
      end else begin
        if(ENABLE) begin

          case ({MODO})
            2'b00: begin
              if( Q == 15 ||  Q >=13 /*4'b1011*/ ) begin
                 RCO <= 1'b1;
                 Q <=  Q[3:0] + 4'b0011;
                 LOAD <= 0;
              end else begin
                 Q <=  Q[3:0] + 4'b0011;
                 LOAD <= 0;
                 RCO <= 1'b0;
              end
            end

            2'b01: begin
                if( Q == 4'b0000 ) begin
                   RCO <=  1'b1;
                   Q <=  Q[3:0] - 4'b0001;
                   LOAD <= 0;
                end else begin
                   Q <=  Q[3:0] - 4'b0001;
                   LOAD <= 0;
                   RCO <=  1'b0;
                end
            end

            2'b10: begin
                if( Q == 4'b1111 ) begin
                   RCO <=  1'b1;
                   Q <=  Q[3:0] + 4'b0001;
                   LOAD <= 0;
                end else begin
                   Q <=  Q[3:0] + 4'b0001;
                   LOAD <= 0;
                   RCO <=  1'b0;
                end
            end

            2'b11: begin
               RCO <= 0;
               Q <=  D;
               LOAD <= 1;
            end

            default: begin
               RCO <= 0;
               Q <= 0;
               LOAD <= 0;
            end

          endcase
        end
        else begin  // ENABLE == 0 & RESET == 0
           Q <= 4'bzzzz;    //////////////////////////////////////////////// H-I ZZZZZZZZZZZZZ
        end
      end
    end
endmodule

`endif