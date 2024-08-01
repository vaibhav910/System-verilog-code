// Code your testbench here
// or browse Examples

///                               1st eample
///                               put-port

//`include "uvm_macros.svh"    
//import uvm_pkg::*;
//
//
//
//class producer extends uvm_component;
//  `uvm_component_utils(producer)  
//  
//  int data = 33;
//  
//  uvm_blocking_put_port #(int) port;
//  
//  function new(input string path = "consumer", uvm_component parent = null);
//    super.new(path,parent);
//  endfunction
//  
//  virtual function void build_phase(uvm_phase phase);
//    super.build_phase(phase);
//    port = new("port",this);
//  endfunction
//  
//  virtual task main_phase(uvm_phase phase);
//    phase.raise_objection(this);
//    port.put(data);
//    `uvm_info("Producer",$sformatf("Data SEND:  %d",data),UVM_NONE);
//    phase.drop_objection(this);
//  endtask
//  
//  
//endclass
//
//
///////////////////////////////////////////////////////////////////////////////////////////////
//
//class consumer extends uvm_component;
//  `uvm_component_utils(consumer) 
//  
//  uvm_blocking_put_imp #(int,consumer) imp;
//  
//  function new(input string path = "consumer", uvm_component parent = null);
//    super.new(path,parent);
//  endfunction
//  
//  virtual function void build_phase(uvm_phase phase);
//    super.build_phase(phase);
//    imp = new("imp",this); 
//  endfunction
//  
//  virtual task put(input int data);
//    `uvm_info("Consumer",$sformatf("Data RECD:  %d",data),UVM_NONE);
//  endtask
//  
//  
//endclass
//
///////////////////////////////////////////////////////////////////////////////////////////////
//
//class env extends uvm_env;
//  `uvm_component_utils(env) 
//  
//  producer p;
//  consumer c;
//  
//
//  
//  function new(input string path = "env", uvm_component parent = null);
//    super.new(path,parent);
//  endfunction
//  
//  virtual function void build_phase(uvm_phase phase);
//    super.build_phase(phase);
//    c =consumer::type_id::create("c",this);
//    p =producer::type_id::create("p",this); 
//  endfunction
//  
// virtual function void connect_phase(uvm_phase phase);
//   super.connect_phase(phase);
//   p.port.connect(c.imp); 
//  endfunction 
//  
//  
//endclass
//
///////////////////////////////////////////////////////////////////////////////////////////////
//
//class test extends uvm_test;
//  `uvm_component_utils(test) 
//  
//  
//  env e;
//  
//  function new(input string path = "consumer", uvm_component parent = null);
//    super.new(path,parent);
//  endfunction
//  
//  virtual function void build_phase(uvm_phase phase);
//    super.build_phase(phase);
//    e =env::type_id::create("e",this);
//  endfunction
//    
//  
//endclass
//
///////////////////////////////////////////////////////////////////////////////////////////////
//
//module  tb;
//  
//  initial begin
//    
//    
//    run_test("test");
//  end
//  
//endmodule




///////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////





///                        2nd example
///                         get port   

//
//`include "uvm_macros.svh"
//import uvm_pkg::*;
//
//
//
//class producer extends uvm_component;
//  `uvm_component_utils(producer)  
//  
//  int data = 0;
//  
//  uvm_blocking_get_port #(int) port;
//  
//  function new(input string path = "consumer", uvm_component parent = null);
//    super.new(path,parent);
//  endfunction
//  
//  virtual function void build_phase(uvm_phase phase);
//    super.build_phase(phase);
//    port = new("port",this);
//  endfunction
//  
//  virtual task main_phase(uvm_phase phase);
//    phase.raise_objection(this);
//    port.get(data);
//    `uvm_info("Producer",$sformatf("Data SEND2:  %d",data),UVM_NONE);
//    phase.drop_objection(this);
//  endtask
//  
//  
//endclass
//
//
///////////////////////////////////////////////////////////////////////////////////////////////
//
//class consumer extends uvm_component;
//  `uvm_component_utils(consumer) 
//  int data = 23;
//  
//  uvm_blocking_get_imp #(int,consumer) imp;
//  
//  function new(input string path = "consumer", uvm_component parent = null);
//    super.new(path,parent);
//  endfunction
//  
//  virtual function void build_phase(uvm_phase phase);
//    super.build_phase(phase);
//    imp = new("imp",this); 
//  endfunction
//  
//  virtual task get(output int datar);
//    `uvm_info("Consumer",$sformatf("Data RECD2:  %d",data),UVM_NONE);
//    datar = data;
//  endtask
//  
//  
//endclass
//
///////////////////////////////////////////////////////////////////////////////////////////////
//
//class env extends uvm_env;
//  `uvm_component_utils(env) 
//  
//  producer p;
//  consumer c;
//  
//
//  
//  function new(input string path = "env", uvm_component parent = null);
//    super.new(path,parent);
//  endfunction
//  
//  virtual function void build_phase(uvm_phase phase);
//    super.build_phase(phase);
//    c =consumer::type_id::create("c",this);
//    p =producer::type_id::create("p",this); 
//  endfunction
//  
// virtual function void connect_phase(uvm_phase phase);
//   super.connect_phase(phase);
//   p.port.connect(c.imp); 
//  endfunction 
//  
//  
//endclass
//
///////////////////////////////////////////////////////////////////////////////////////////////
//
//class test extends uvm_test;
//  `uvm_component_utils(test) 
//  
//  
//  env e;
//  
//  function new(input string path = "consumer", uvm_component parent = null);
//    super.new(path,parent);
//  endfunction
//  
//  virtual function void build_phase(uvm_phase phase);
//    super.build_phase(phase);
//    e =env::type_id::create("e",this);
//  endfunction
//    
//  
//endclass
//
///////////////////////////////////////////////////////////////////////////////////////////////
//
//module  tb;
//  
//  initial begin
//    
//    
//    run_test("test");
//  end
//  
//endmodule


///                    3rd  example
///                    Transport Port


`include "uvm_macros.svh"
import uvm_pkg::*;



class producer extends uvm_component;
  `uvm_component_utils(producer)  
  
  int datas = 10;
  int datar = 0;
  
  uvm_blocking_transport_port #(int,int) port;
  
  function new(input string path = "consumer", uvm_component parent = null);
    super.new(path,parent);
  endfunction
  
  virtual function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    port = new("port",this);
  endfunction
  
  virtual task main_phase(uvm_phase phase);
    phase.raise_objection(this);
    port.transport(datas,datar);
    `uvm_info("Consumer",$sformatf("Data RECD2:  %d,Data SEND:  %d",datar,datas),UVM_NONE);
  
    phase.drop_objection(this);
  endtask
  
  
endclass


/////////////////////////////////////////////////////////////////////////////////////////////

class consumer extends uvm_component;
  `uvm_component_utils(consumer) 
  int datar = 0;
  int datas = 99;
  
  uvm_blocking_transport_imp #(int,int,consumer) imp;
  
  function new(input string path = "consumer", uvm_component parent = null);
    super.new(path,parent);
  endfunction
  
  virtual function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    imp = new("imp",this); 
  endfunction
  
  virtual task transport(input int datar,output int datas);
    datas = this.datas;
    `uvm_info("Consumer",$sformatf("Data RECD2:  %d,Data SEND:  %d",datar,datas),UVM_NONE);
     endtask
  
  
endclass

/////////////////////////////////////////////////////////////////////////////////////////////

class env extends uvm_env;
  `uvm_component_utils(env) 
  
  producer p;
  consumer c;
  

  
  function new(input string path = "env", uvm_component parent = null);
    super.new(path,parent);
  endfunction
  
  virtual function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    c =consumer::type_id::create("c",this);
    p =producer::type_id::create("p",this); 
  endfunction
  
 virtual function void connect_phase(uvm_phase phase);
   super.connect_phase(phase);
   p.port.connect(c.imp); 
  endfunction 
  
  
endclass

/////////////////////////////////////////////////////////////////////////////////////////////

class test extends uvm_test;
  `uvm_component_utils(test) 
  
  
  env e;
  
  function new(input string path = "consumer", uvm_component parent = null);
    super.new(path,parent);
  endfunction
  
  virtual function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    e =env::type_id::create("e",this);
  endfunction
    
  
endclass

/////////////////////////////////////////////////////////////////////////////////////////////

module  tb;
  
  initial begin
    
    
    run_test("test");
  end
  
endmodule



