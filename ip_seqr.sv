// IP SEQR //

class ip_seqr extends uvm_sequencer #(seq_item);
  `uvm_component_utils(ip_seqr)
   function new(string name = "ip_seqr",uvm_component parent);
    super.new(name, parent);
     `uvm_info("ip_seqr","Inside fifo ip_seqr new",UVM_MEDIUM)
  endfunction
  
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    `uvm_info("ip_seqr","Inside fifo build_phase",UVM_MEDIUM)
  endfunction
  
  function void connect_phase(uvm_phase phase);
    super.connect_phase(phase);
    `uvm_info("ip_seqr","Inside fifo connect_phase",UVM_MEDIUM)
  endfunction
  
  task run_phase(uvm_phase phase);
    super.run_phase(phase);
    `uvm_info("ip_seqr","Inside fifo run_phase",UVM_MEDIUM)
  endtask
  
endclass
