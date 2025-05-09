// OP MONITOR //

class op_monitor extends uvm_monitor;
  `uvm_component_utils(op_monitor)
    virtual fifo_intf vif;
    seq_item h_pkt;  
  uvm_analysis_port#(seq_item)  op_mon2scbd;
  
   function new(string name = "op_monitor",uvm_component parent);
    super.new(name, parent);
     `uvm_info("op_monitor","Inside fifo op_monitor new",UVM_MEDIUM)
  endfunction
  
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    `uvm_info("op_monitor","Inside op_monitor build_phase",UVM_MEDIUM)
    op_mon2scbd = new("op_mon2scbd",this);
        if(!uvm_config_db #(virtual fifo_intf):: get(this,"","intf1",vif)) begin
      `uvm_fatal("ip_mon","danger")
    end
    h_pkt=seq_item::type_id::create("h_pkt",this);
  endfunction
  
  function void connect_phase(uvm_phase phase);
    super.connect_phase(phase);
    `uvm_info("op_monitor","Inside op_monitor connect_phase",UVM_MEDIUM)
  endfunction
  
  task run_phase(uvm_phase phase);
    super.run_phase(phase);
    `uvm_info("op_monitor","Inside op_monitor run_phase",UVM_MEDIUM)
        forever begin
      @(posedge vif.clk);
          if(vif.rst== 'b1 && vif.wr== 'b0 && vif.rd== 'b1 && vif.data_out > 0 )
        begin
          h_pkt.data_out=vif.data_out;
          //h_pkt.wr=vif.wr;
          h_pkt.rd=vif.rd;
          h_pkt.fifo_cnt=vif.fifo_cnt;
          h_pkt.full=vif.full;
          h_pkt.empty=vif.empty;
          op_mon2scbd.write(h_pkt);
          `uvm_info("ip monitor","input data packet is recived ",UVM_MEDIUM)
          h_pkt.print();
        end
    end
  endtask
  
endclass
