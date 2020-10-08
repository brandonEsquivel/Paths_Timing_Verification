task monitor;
// MONITORING ALL FUNCTIONAL SIGNALS FOR COUNTER
reg [3:0] mon_D, mon_Q;
reg mon_ENABLE, mon_LOAD, mon_RCO, RESET;

forever always (posedge clk) begin
    mon_Q <= Q;
    mon_D <= D;
    mon_ENABLE <= ENABLE;
    mon_LOAD <= LOAD;
    mon_RCO <= RCO;
    mon_RESET <= RESET;
end
endtask