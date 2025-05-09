// IP DRIVER //

class ip_driver extends uvm_driver #(seq_item);
  `uvm_component_utils(ip_driver)
  seq_item h_pkt;
  
  virtual fifo_intf vif;
  
   function new(string name = "ip_driver",uvm_component parent);
    super.new(name, parent);
     `uvm_info("ip_driver","Inside fifo ip_driver new",UVM_MEDIUM)
  endfunction
  
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    `uvm_info("ip_driver","Inside ip_driver build_phase",UVM_MEDIUM)
    if(!uvm_config_db#(virtual fifo_intf)::get(this,"","intf1",vif)) begin
      `uvm_fatal("ip_driver","virtual intf instance not collected properly")
    end
  endfunction
  
  function void connect_phase(uvm_phase phase);
    super.connect_phase(phase);
    `uvm_info("ip_driver","Inside ip_driver connect_phase",UVM_MEDIUM)
  endfunction
  
  task run_phase(uvm_phase phase);
    super.run_phase(phase);
    
    //`uvm_info("ip_driver","Inside ip_driver run_phase",UVM_MEDIUM)
   // wait(vif.rst==1);
    forever begin
       @(posedge vif.clk);
      seq_item_port.get_next_item(h_pkt);
          //drive_transfer(h_pkt);
      `uvm_info("seq", $sformatf("In driver of %p items",h_pkt), UVM_LOW)
            vif.wr <= h_pkt.wr;
            vif.rd <= h_pkt.rd;
            vif.data_in <= h_pkt.data_in;        
          //  vif.fifo_cnt <= h_pkt.fifo_cnt;
            seq_item_port.item_done();
           
      
    end
  endtask:run_phase
  

  
endclass:ip_driver
    
