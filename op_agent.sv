// OP AGENT (PASSIVE) //

class op_agent extends uvm_agent;
  `uvm_component_utils(op_agent)
   op_monitor	h_op_mon;
  
  function new(string name = "op_agent",uvm_component parent);
    super.new(name, parent);
    `uvm_info("op_agent","Inside op_agent new",UVM_MEDIUM)
  endfunction
  
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    `uvm_info("op_agent","build_phase",UVM_MEDIUM)
    h_op_mon = op_monitor::type_id::create("h_op_mon",this);
  endfunction
  
  function void connect_phase(uvm_phase phase);
    super.connect_phase(phase);
    `uvm_info("op_agent","connect_phase",UVM_MEDIUM)
  endfunction
  
  task run_phase(uvm_phase phase);
    super.run_phase(phase);
    `uvm_info("op_agent","run_phase",UVM_MEDIUM)
  endtask
  
endclass
