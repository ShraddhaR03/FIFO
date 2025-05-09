// SEQ //

class seq extends uvm_sequence #(seq_item);
  `uvm_object_utils(seq)
  seq_item h_pkt;
  
  function new(string name = "seq");
    super.new(name);
    `uvm_info("seq","Inside fifo seq new",UVM_MEDIUM)

   endfunction
  
  virtual task body();
    // start seq on seqr
    write();
    read();
    multiple_write();
    multiple_read();
    repeat(8)
       begin
   		 write();
   		 read();
     end
  endtask
  
  virtual task write();
    h_pkt=seq_item::type_id::create("h_pkt");
    start_item(h_pkt);
     assert(h_pkt.randomize() with { wr == 1; rd == 0; }) else `uvm_error("seq", "Randomization failed for write transaction");
    finish_item(h_pkt);
    `uvm_info("seq", $sformatf("Done generation of %p items",h_pkt), UVM_LOW)
  endtask 
  
  virtual task read();
    h_pkt=seq_item::type_id::create("h_pkt");
    start_item(h_pkt);
    assert(h_pkt.randomize() with { wr == 0; rd == 1; }) else `uvm_error("seq",        "Randomization failed for read transaction");
    finish_item(h_pkt);
    `uvm_info("seq", $sformatf("Done generation of %p items",h_pkt), UVM_LOW)
  endtask
  
   virtual task multiple_write();
    repeat(8)
      begin
         h_pkt=seq_item::type_id::create("h_pkt");
    start_item(h_pkt);
     assert(h_pkt.randomize() with { wr == 1; rd == 0; }) else         `uvm_error("seq", "Randomization failed for write transaction");
    finish_item(h_pkt);
     `uvm_info("seq", $sformatf("Done generation of %p items",h_pkt),UVM_LOW)
      end
  endtask            
           
 virtual task multiple_read();
   repeat(8)
      begin
      h_pkt=seq_item::type_id::create("h_pkt");
    start_item(h_pkt);
    assert(h_pkt.randomize() with { wr == 0; rd == 1; }) else `uvm_error("seq","Randomization failed for read transaction");
    `uvm_info("seq", $sformatf("Done generation of %p items",h_pkt), UVM_LOW)
        finish_item(h_pkt);

      end
  endtask
endclass

class roll_over extends seq;
  `uvm_object_utils(roll_over)
  seq_item h_pkt;
  
  function new(string name = "roll_over");
    super.new(name);
    `uvm_info("roll_over","Inside fifo roll_over",UVM_MEDIUM)
  endfunction 
  
  virtual task body();
    repeat(9)
    super.multiple_write();  
    repeat(9)
   super.multiple_read();         
  endtask
              
 
endclass 
 


  
  
  
 
    
    
   
