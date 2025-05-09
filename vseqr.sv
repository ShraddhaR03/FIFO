// VSEQR //
class vseqr extends uvm_sequencer;
  `uvm_component_utils(vseqr)
  ip_seqr	h_ip_seqr;   // handle of physical seqr
  
  function new(string name = "vseqr",uvm_component parent);
    super.new(name, parent);
    `uvm_info("vseqr","Inside vseqr new",UVM_MEDIUM)
  endfunction
  
  task body();
    h_ip_seqr = ip_seqr:: type_id :: create("h_ip_seqr",this);
  endtask
  
endclass
