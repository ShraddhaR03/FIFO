// INTERFACE //

interface fifo_intf(input logic clk, rst);
  logic [7:0]data_in;
  logic wr;
  logic rd;
  logic empty;
  logic full;
  logic [3:0]fifo_cnt;
  logic [7:0]data_out;
endinterface
