task checker;
// comparing modules outputs with scoreboards inputs

input integer iteration;

  repeat (iteration) @ (posedge clk) begin
	  if (( syn_Q == Q) && ( syn_RCO == RCO) && ( syn_LOAD == LOAD)) begin
      $fdisplay(log, "PASS ALL");
      end
    else begin
      $fdisplay(log, "Time=%.0f Error! DUV: Q=%d, RCO=%b, LOAD=%b, scoreboard:  syn_Q=%d,  syn_RCO=%b,  syn_LOAD=%b", $time, Q, RCO, LOAD,  syn_Q,  syn_RCO,  syn_LOAD);
      end
  end // repeat
endtask
