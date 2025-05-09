// Code your testbench here
// or browse Examples
// TB TOP //

`include "fifo_pkg.sv"
 import fifo_pkg ::*;
import uvm_pkg ::*;
`include "uvm_macros.svh" 

`include "fifo_intf.sv"

//`include "design.sv"

module tb_top();
  bit clk, rst;
  
  parameter CLOCK_PERIOD = 5;
  parameter RESET_PERIOD = 4;
  
  fifo_intf intf(clk, rst);
  
   fifo_dut	i_fifo_dut(.clk(clk),.rst(rst),.data_in(intf.data_in),.empty(intf.empty),.full(intf.full),.fifo_cnt(intf.fifo_cnt),.data_out(intf.data_out),.wr(intf.wr),.rd(intf.rd));
  task clk_generation();
    clk = 'b0;
    forever begin
      #(CLOCK_PERIOD/2) clk = ~clk;
    end
  endtask
  
  task rst_generation();
    rst = 'b0;
    #(RESET_PERIOD);
    rst = 'b1;
//     #50;
//     rst='b0;
//     #10;
//     rst='b1;
  endtask
  
  initial begin
      clk_generation();
  end
  
  initial begin
      rst_generation();
  end   
    initial begin
    $dumpfile("dump.vcd"); $dumpvars;
  end
  
  initial begin
    uvm_config_db#(virtual fifo_intf)::set(null,"*","intf1",intf);   
    run_test("fifo_test");
  end
  
  initial begin
    #500;
    $finish;
  end
  
endmodule
