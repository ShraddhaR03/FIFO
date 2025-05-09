// VSEQ //
class vseq extends uvm_sequence;
  `uvm_object_utils(vseq)
   seq 	h_seq;
 // seq_one h_seqone;
  ip_seqr h_ip_seqr;
  
  `uvm_declare_p_sequencer(vseqr);
  
  function new(string name ="vseq");
    super.new(name);
    `uvm_info("vseq","Inside vseq new",UVM_MEDIUM)
  endfunction
  
   task body();
  `uvm_info("Virtual sequence", "Inside virtual sequence", UVM_NONE)
  h_seq = seq :: type_id :: create("h_seq"); 
  h_seq.start(p_sequencer.h_ip_seqr);
     
  //h_seqone = seq_one :: type_id :: create("h_seqone");
     //h_seqone.start(p_sequencer.h_ip_seqr);
  endtask

endclass
