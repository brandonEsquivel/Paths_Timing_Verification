//Init task for clean output signals
task drv_init;
  begin
    ENABLE <= 0;
    @(negedge clk)
      RESET = 1;
    @(negedge clk)
      RESET = 0;
    @(negedge clk)
      RESET = 0;
    @(negedge clk)
      RESET = 0;
      ENABLE <= 1;
  end
endtask


//Drive controled sum request
task drv_RESET_request;

input integer iteration;
  begin
    MODO = 2'b11;   // start at counter  charge
    D <= 4'b0000;   // init D at 0
    ENABLE <= 1;    // init ENABLE at 1;
    repeat (iteration) begin

      @(negedge clk) begin
        D <= D + 1;       // feedback
        if(MODO==3) begin
          MODO <= MODO + 3;   // modo 10
        end
      end
    end
    RESET <= 1;
    ENABLE <= 1;

    @(negedge clk) begin
      D <= D + 1;
    end
    @(negedge clk) begin
      D <= D + 1;
    end
  end
endtask




//Drive controled sum request
task drv_MODO_request;

input integer iteration;
  begin
    MODO = 2'b11;   // start at counter  charge
    D <= 4'b0000;   // init D at 0
    ENABLE <= 1;    // init ENABLE at 1;
    repeat (iteration) begin

      @(negedge clk) begin
        D <= D + 1;       // feedback
        if(RCO || MODO==3) begin
          MODO <= MODO + 1;
        end
      end
    end
  end
endtask


//Drive controled sum request
task drv_MODO00_request;

input integer iteration;
  begin
    MODO = 2'b11;   // start at counter  Q + 3
    D <= 4'b0000;   // init D at 0
    ENABLE <= 1;    // init ENABLE at 1;
    repeat (iteration) begin

      @(negedge clk) begin
        D <= D + 1;       // feedback
        if(MODO==3) begin
          MODO <= MODO + 1;
        end
      end
    end
  end
endtask


//Drive controled sum request
task drv_MODO01_request;

input integer iteration;
  begin
    MODO = 2'b11;   // start at counter  Q + 3
    D <= 4'b0000;   // init D at 0
    ENABLE <= 1;    // init ENABLE at 1;
    repeat (iteration) begin

      @(negedge clk) begin
        D <= D + 1;       // feedback
        if(MODO==3) begin
          MODO <= MODO + 2;
        end
      end
    end
  end
endtask



//Drive controled sum request
task drv_MODO10_request;

input integer iteration;
  begin
    MODO = 2'b11;   // start at counter  Q + 3
    D <= 4'b0000;   // init D at 0
    ENABLE <= 1;    // init ENABLE at 1;
    repeat (iteration) begin

      @(negedge clk) begin
        D <= D + 1;       // feedback
        if(MODO==3) begin
          MODO <= MODO + 3;
        end
      end
    end
  end
endtask


//Drive random request
task drv_random_request;

input integer iteration;
  begin
    repeat (iteration) begin
      @(negedge clk) begin
        D <= $random;
        MODO <= $random;
      end
    end
  end
endtask



//Drive controled sum request
task drv_RESET2_request;

input integer iteration;
  begin
    D <= 4'b0000;   // init D at 0
    ENABLE <= 1;    // init ENABLE at 1;
    repeat (iteration) begin

      @(negedge clk) begin
        D <= D + 1;       // feedback
      end
    end
    RESET <= 1;
    ENABLE <= 1;

    @(negedge clk) begin
      D <= D + 1;
    end
    @(negedge clk) begin
      D <= D + 1;
    end
  end
endtask

/*Tasks are used in most of the programming languages, known
commonly as procedures or subroutines. Tasks are intended to
reduce the Design code and its calls are made at compile time.
Tasks offer the possibility of allowing input and / or output
parameters using nodes declared inthe module that makes the calls.
Tasks:
--They are defined in the module in which they are used, although
--they can be defined in a separate file and be included using Verilog's  include directive.
--They can include delays like #delay, posedge, or negedge.
--They can have any number of inputs / outputs. The definition of inputs and / or outputs mark the order in which they must be passed to the task.  
--Variables that are declared within a task are local to that task. Tasks can use and / or assign values ​​to any signal declared as global in design.
--A task can call another task or function. They can be used to model both combinational and sequential logic.
--The call to a task cannot be done within an expression.*/