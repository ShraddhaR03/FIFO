class fifo_test extends uvm_test;
  `uvm_component_utils(fifo_test)
  env 	h_env;
  vseq	h_vseq;
  seq	h_seq;
  vseqr h_vseqr;  

  
  function new(string name = "fifo_test",uvm_component parent);
    super.new(name,parent);
    `uvm_info("test","Inside fifo_test new",UVM_MEDIUM)
  endfunction
  
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    `uvm_info("test","Inside fifo_test build_phase",UVM_MEDIUM)
    h_vseq = vseq::type_id::create("h_vseq");
    h_seq = seq::type_id::create("h_seq");
    h_env = env::type_id::create("h_env",this);
  endfunction
  
  function void connect_phase(uvm_phase phase);
    super.connect_phase(phase);
    `uvm_info("test","Inside fifo_test connect_phase",UVM_MEDIUM)
  endfunction
  
  function void end_of_elaboration_phase(uvm_phase phase);
    super.end_of_elaboration_phase(phase);
    `uvm_info("test","Inside fifo_test end_of_elaboration_phase",UVM_MEDIUM)
    uvm_top.print_topology();
  endfunction
  
  task run_phase(uvm_phase phase);
    super.run_phase(phase);
    `uvm_info("test","Inside fifo_test run_phase",UVM_MEDIUM)
    phase.raise_objection(this);
    // start vseq on vseqr //
    h_vseq.start(h_env.h_vseqr);
    #100;
    phase.drop_objection(this);
  endtask
  
endclass
