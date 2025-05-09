// SCOREBOARD //

class scoreboard extends uvm_scoreboard;
  `uvm_component_utils(scoreboard)
  
  // DECLARATION
  `uvm_analysis_imp_decl(_ip_imp)
  `uvm_analysis_imp_decl(_op_imp)
  
   // IMPLEMENTATION
   uvm_analysis_imp_ip_imp #(seq_item,scoreboard) ip_mon2sb_imp_port;
   uvm_analysis_imp_op_imp #(seq_item,scoreboard) op_mon2sb_imp_port;
   int fail_count,pass_count;
   seq_item h_pkt;
  int ip_queue[$];
  int op_queue[$];
  
   function new(string name = "scoreboard",uvm_component parent);
    super.new(name, parent);
     `uvm_info("scoreboard","Inside fifo scoreboard new",UVM_MEDIUM)

  endfunction
  
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    `uvm_info("scoreboard","Inside scoreboard build_phase",UVM_MEDIUM)
    ip_mon2sb_imp_port = new("ip_mon2sb_imp_port",this);
    op_mon2sb_imp_port = new("op_mon2sb_imp_port",this);
  endfunction
  
  function void connect_phase(uvm_phase phase);
    super.connect_phase(phase);
    `uvm_info("scoreboard","Inside scoreboard connect_phase",UVM_MEDIUM)
  endfunction
  
  function void write_ip_imp(seq_item h_pkt);
    ip_queue.push_back(h_pkt.data_in);
    `uvm_info("scoreboard",$sformatf("inside the scoreboard ip_monitor values are %s item",h_pkt.sprint()),UVM_MEDIUM)
  endfunction
  
  function void write_op_imp(seq_item h_pkt);
    op_queue.push_back(h_pkt.data_out);
    `uvm_info("scoreboard",$sformatf("inside the scoreboard op_monitor values are %s item",h_pkt.sprint()),UVM_MEDIUM)
  endfunction
  
  task run_phase(uvm_phase phase);
    super.run_phase(phase);
    `uvm_info("scoreboard","Inside scoreboard run_phase",UVM_MEDIUM)
    forever begin
      wait(ip_queue.size>0);
      wait(op_queue.size>0);
      
     // `uvm_info("RUN_PHASE",$sformatf("length of ip_queue and op_queue is%0d  and %0d respectively",ip_queue.size(),op_queue.size()),UVM_LOW)
      compare();
    
    end
  endtask
  
  virtual task compare();
    int exp_data;
    int act_data;
    act_data = op_queue.pop_front();
    exp_data = ip_queue.pop_front();
    if (exp_data == act_data)
      begin
        pass_count ++;
        `uvm_info("compare",$sformatf("PASSED,at time :%0t Exp_data is matched with act_data ---- exp_data=%0d, act_data=%0d",$time,exp_data,act_data),UVM_LOW)
      end
    else
      begin
      `uvm_info("compare",$sformatf("FAILED ,at time :%0t Exp_data is not matched with act_data ---- exp_data=%0d, act_data=%0d",$time,exp_data,act_data),UVM_LOW)
      fail_count++;
      end
    
  endtask
  
  virtual function void report_phase(uvm_phase phase);
    `uvm_info("report_phase",$sformatf("scoreboard result: passed =%0d , failed =%0d", pass_count,fail_count),UVM_NONE)
    if(fail_count>0)
      begin
        `uvm_error("report_phase",$sformatf("test failed with %0d mismatches",fail_count))
      end
    else begin
      `uvm_info("report_phase","test  passed with all data matching",UVM_NONE)
    end
  endfunction
endclass
