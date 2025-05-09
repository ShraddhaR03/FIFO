// SEQ_ITEM //

class seq_item extends uvm_sequence_item;
  bit clk,rst;
 rand bit [7:0]data_in;
 rand bit wr;
  rand bit rd;
  bit empty;
  bit full;
  bit [3:0]fifo_cnt;
  bit [7:0]data_out;
  bit rd_ptr;
  bit wr_ptr;
  
 // constraint wr1 {wr==1;}
 // constraint rd1{rd==1;}
  
 //  constraint data_in_c {
 //    data_in inside {0, 5, 10}; 
 // }
  
  `uvm_object_utils_begin(seq_item)
  `uvm_field_int(data_in, UVM_ALL_ON)
  `uvm_field_int(rd, UVM_ALL_ON)
  `uvm_field_int(wr, UVM_ALL_ON)
  `uvm_field_int(full, UVM_ALL_ON)
  `uvm_field_int(empty, UVM_ALL_ON)
  `uvm_field_int(data_out, UVM_ALL_ON)
  `uvm_object_utils_end
  
  function new(string name = "seq_item");
    super.new(name);
    `uvm_info("seq_item","Inside fifo seq_item new",UVM_MEDIUM)
  endfunction
  
//   function string convert2string();
//     return $sformatf("wr=%0d rd=%0d data_in=%0d", wr, rd, data_in);
//   endfunction
  
endclass
