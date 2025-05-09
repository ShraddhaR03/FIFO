// ENV //

class env extends uvm_env;
  `uvm_component_utils(env )
   vseqr		h_vseqr;
  ip_agent		h_ip_agent;
  op_agent		h_op_agent;
  scoreboard	h_scbd;
  coverage_collector h_cov;
  function new(string name = "env ",uvm_component parent);
    super.new(name, parent);
    `uvm_info("Env Class","Inside fifo_env new",UVM_MEDIUM)
  endfunction
  
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    `uvm_info("Env Class","inside fifo_env build_phase",UVM_MEDIUM)
    h_vseqr = vseqr::type_id::create("h_vseqr",this);
    h_ip_agent = ip_agent::type_id::create("h_ip_agent",this);
    h_op_agent = op_agent::type_id::create("h_op_agent",this);
    h_scbd	= scoreboard::type_id::create("h_scbd",this);
    h_cov  =  coverage_collector::type_id::create("h_cov",this);
    
  endfunction
  
  function void connect_phase(uvm_phase phase);
    super.connect_phase(phase);
    `uvm_info("Env Class","inside fifo_env  connect_phase",UVM_MEDIUM)
    h_vseqr.h_ip_seqr = h_ip_agent.h_ip_seqr;
    h_ip_agent.h_ip_mon.ip_mon2scbd.connect(h_scbd.ip_mon2sb_imp_port);
    h_op_agent.h_op_mon.op_mon2scbd.connect(h_scbd.op_mon2sb_imp_port);
    h_ip_agent.h_ip_mon.ip_mon2scbd.connect(h_cov.analysis_export);
    h_op_agent.h_op_mon.op_mon2scbd.connect(h_cov.analysis_export);

  endfunction
  
  task run_phase(uvm_phase phase);
    super.run_phase(phase);
    `uvm_info("Env Class","inside fifo_env run_phase",UVM_MEDIUM)
  endtask
  
endclass
