`timescale 1 ns / 1 ps

/* A simple clock module */

module clk (clock);

output clock;
reg clock;

initial begin
clock = 0;
end

always begin
 #100 clock = !clock;        // T = 200 ns
end

endmodule