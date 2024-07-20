//// Code your testbench here
//// or browse Examples



//Question 1
// Generate two 9-bit no. which are not equal and no. of '1' is 5 of there xor
// A= 010101111, B =010010100 ,A xorB =000111011  A xor B contains 5 '1' and A is not equal to B



class c5bit;
  
  rand bit [8:0]A;
  rand bit [8:0]B;
  
  constraint cons_1{A != B;                  
  };
  
  constraint cons_2{$countones(A^B)==5;}
  
  
endclass

module tb;
 
  c5bit cc;
  
  
  initial 
  begin
    cc =new();
    repeat(10) begin
    cc.randomize();
    $display("A= %b, B =%b ,A^B =%b",cc.A,cc.B,cc.A^cc.B);
    end
  end
endmodule



// Question 2
// generate 32 bit address contains 10 '1' bits and no adjacent bit are 1
// Example 10010010001001001000101000101001 this no . is wrong contains 11 'ones'.
// Example 10010010001001001000101000000011 this no. is wrong last 2 adjacent bits are 'ones'.



class a32bit_addr;
 
  rand bit [31:0]a_aadr;
  
  constraint cons_1{$countones(a_aadr)==10;
                    foreach(a_aadr[i])
                      if((i<31)&&(a_aadr[i]==a_aadr[i+1])) a_aadr[i] !=1;
                   }
  
endclass

module tb;
  a32bit_addr ad;
  
  initial begin
    ad = new();
    repeat(20) begin
    ad.randomize();
    $display("a_aadr= %b",ad.a_aadr);
    end
    
  end
endmodule


// update soon
//fibbonacci series.
//factorial
//palindrome
