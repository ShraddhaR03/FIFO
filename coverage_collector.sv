class coverage_collector extends uvm_subscriber#(seq_item);
  `uvm_component_utils(coverage_collector)
  seq_item h_pkt;
  
  
  
//   covergroup cg;
    
//     cp1:coverpoint h_pkt.wr{bins b1[1]={[0:1]};}
//     cp2:coverpoint h_pkt.rd{bins b2[1]={[0:1]};}
//     cp3:coverpoint h_pkt.data_in{bins b3[1]={[0:7]};}
//     cp4:coverpoint h_pkt.data_out{bins b4[1]={[0:7]};}
//   endgroup
    covergroup cg;
      option.per_instance=1;
    
    cp1:coverpoint h_pkt.wr;
    cp2:coverpoint h_pkt.rd;
    cp3:coverpoint h_pkt.data_in;
    cp4:coverpoint h_pkt.data_out;
  endgroup
  
  function new(string name = "coverage_collector",uvm_component parent);
    super.new(name, parent);
     h_pkt=seq_item::type_id::create("h_pkt");
    `uvm_info("coverage_collector","Inside fifo coverage_collector",UVM_MEDIUM)
    cg=new();
   endfunction
  
  virtual function void write(seq_item t);
    h_pkt=t;
    cg.sample();
    `uvm_info("coverage_collector",$sformatf("the functional coverage is :%d",cg.get_coverage),UVM_MEDIUM);
   
  endfunction
  
  
endclass

