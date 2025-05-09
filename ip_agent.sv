
// IP AGENT (ACTIVE) //

class ip_agent extends uvm_agent;
  `uvm_component_utils(ip_agent)
   ip_seqr		h_ip_seqr;
   ip_driver	h_ip_dri;
   ip_monitor	h_ip_mon;
  
  function new(string name = "ip_agent",uvm_component parent);
    super.new(name, parent);
    `uvm_info("ip_agent","Inside fifo ip_agent new",UVM_MEDIUM)
  endfunction
  
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    `uvm_info("ip_agent","fifo build_phase",UVM_MEDIUM)
    h_ip_seqr = ip_seqr::type_id::create("h_ip_seqr",this);
    h_ip_dri = ip_driver::type_id::create("h_ip_dri",this);
    h_ip_mon = ip_monitor::type_id::create("h_ip_mon",this);
    
  endfunction
  
  function void connect_phase(uvm_phase phase);
    super.connect_phase(phase);
    `uvm_info("ip_agent","fifo connect_phase",UVM_MEDIUM)
    h_ip_dri.seq_item_port.connect(h_ip_seqr.seq_item_export);
  endfunction
  
  task run_phase(uvm_phase phase);
    super.run_phase(phase);
    `uvm_info("ip_agent","fifo run_phase",UVM_MEDIUM)
  endtask
  
endclass
