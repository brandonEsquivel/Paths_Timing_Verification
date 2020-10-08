`ifndef COUNTERS_TB
`define COUNTERS_TB

`timescale 1 ns / 1 ps

module counters_tb(

// general inputs
input wire clk,

// from behav
input wire [3:0] Q,
input wire RCO, LOAD,

// from syn
output reg [3:0]  syn_Q,
output reg  syn_RCO,  syn_LOAD,

// Generated signals
output reg RESET, ENABLE,
output reg [3:0] D,
output reg [1:0] MODO
);


`include "./testers/driver.v"
`include "./src/checker.v"

parameter ITERATIONS = 100;
integer log;

// WIRES
wire  syn_wRCO,  syn_wLOAD;
wire [3:0]  syn_wQ;

initial begin

  $dumpfile("./test.vcd");
  $dumpvars(0);

  log = $fopen("./log/tb.log");
  $fdisplay(log, "time=%5d, Simulation Start", $time); ////////
  $fdisplay(log, "time=%5d, Starting Reset", $time); ///////

  drv_init();

  $fdisplay(log, "time=%5d, Reset Completed", $time); /////

  $fdisplay(log, "time=%5d, Starting Test", $time);
  fork
    drv_MODO_request(ITERATIONS);
    checker(ITERATIONS);
  join
    //RESET <= 1;     // TESTING reset
    //ENABLE <= 1;
    //drv_RESET2_request(ITERATIONS);

  $fdisplay(log, "time=%5d, MODO Test Completed", $time);
  /*
  $fdisplay(log, "time=%5d, Simulation Completed", $time);

  $fdisplay(log, "time=%5d, Starting Reset", $time); ///////

  drv_init();

  $fdisplay(log, "time=%5d, Reset Completed", $time); /////

  $fdisplay(log, "time=%5d, Starting Random Test", $time);
  fork
    drv_random_request(ITERATIONS);
    checker(ITERATIONS);
  join
  $fdisplay(log, "time=%5d, MODO Test Completed", $time);
*/
  $fdisplay(log, "time=%5d, Simulation Completed", $time);

  $fclose(log);
  #200 $finish;
end

  contador_syn syn(
    //INPUTS
    .clk      (clk),
    .ENABLE   (ENABLE),
    .RESET    (RESET),
    .D     (D),
    .MODO  (MODO),
    // OUTPUTS
    .Q     ( syn_wQ),
    .RCO   ( syn_wRCO),
    .LOAD  ( syn_wLOAD)
  );

  always @(*) begin
     syn_RCO =  syn_wRCO;
     syn_LOAD =  syn_wLOAD;
     syn_Q =  syn_wQ;
  end

endmodule

// Local Variables:
// verilog-library-directories:("."):
// End:
`endif