`ifndef TB_TOP
`define TB_TOP

// Includes

`include "./src/clock.v"
`include "./src/counter.v"
`include "./syn/counter_syn.v"
`include "./lib/cmos_cells.v"
`include "./tesbenches/counters_tb.v"


/*This is the top module of the structure, it maintains the include,
the clock, and the instance of the behavioral module, while the synthesized
structural counter is instantiated and handled within the internal testbench.*/



module tb_top;


// clock instance
clk clock (.clock (clock));

// WIRES
wire RESET, ENABLE, RCO,  syn_RCO, LOAD,  syn_LOAD;
wire [3:0] D, Q,  syn_Q;
wire [1:0] MODO;

counters_tb tb(
 //OUTPUTS
.RESET      (RESET),                 // generated from driver
.ENABLE     (ENABLE),                // generated from driver
.D          (D),                     // generated from driver
.MODO       (MODO),                  // generated from driver

.syn_RCO     (syn_RCO),              // from synth model, to compare, analyze or monitor
.syn_LOAD    (syn_LOAD),             // from synth model, to compare, analyze or monitor
.syn_Q       (syn_Q),                // from synth model, to compare, analyze or monitor

//INPUTS
.Q          (Q),
.RCO        (RCO),
.LOAD       (LOAD),
.clk        (clock)
);

/// Counter behavorial instance

counter     Behav (
.clk        (clock),
.RESET      (RESET),
.ENABLE     (ENABLE),
.MODE       (MODO),
.D          (D),
.LOAD       (LOAD),
.RCO        (RCO),
.Q          (Q)
);


endmodule

// Local Variables:
// verilog-library-directories:("."):
// End:
`endif