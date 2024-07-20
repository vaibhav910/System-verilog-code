
//"This file contains questions related to series or pattern generation using functions. 
//It serves as a resource for practicing and understanding various approaches to generating series and patterns through function-based methods."


// pattern generator  1020304050.........
// pattern generator  111111111111.......
//pattern generator   123456.............
//pattern generator   121221222122.......
//pattern generator   122111333311111....
//pattern generator   122333444455555....


function pattern_genrator_1 (int length);                  // pattern generator  1020304050.........
  
  int a[];
  int org_len;
  if(length%2 == 0) org_len = length/2;
  else org_len = length/2 +1;
  a= new[org_len*2]; 
  for(int i =0; i<org_len;i++)
    begin
        a[2*i]=i+1;
      a[2*i +1] = 0;
    end  
  foreach(a[i]) $display("%d",a[i]);  
  endfunction




function pattern_genrator_2 (int length);                // pattern generator  111111111111.......
  
  int a[];
  a=new[length];  
  for(int i =0; i<length;i++)
    begin
      a[i] = 1;
    end
  foreach(a[i]) $display("%d",a[i]);  
  endfunction





function pattern_genrator_3 (int length);                 //pattern generator   123456.............
  int a[];
  a=new[length];  
  for(int i =0; i<length;i++)
    begin
      a[i] = i+1;
    end  
  foreach(a[i]) $display("%d",a[i]); 
  endfunction




function pattern_genrator_4 (int length);                       //pattern generator   121221222122.......
  int a[];
  int i;
  int l,len;
  a=new[length];
  l =length;
  i=0;
  len=0;
  while(l>0)
    begin
      a[i+len] =1;
      len = ((i*(i+1))/2)+i+1;
      i++;
      l--;
      for(int ii =0;ii<i;ii++)
        begin
          if(l>0) 
            begin
          	a[ii+len] = 2;
          	l--;
          	end
        end
    end
  foreach(a[j]) $display("%d",a[j]);
  endfunction


function pattern_genrator_5 (int length);                         //pattern generator   122111333311111....
  int a[];
  int aa,ab,len,l;
  a= new[length];
  aa=1;
  ab=2;
  len=0;
  l=length;
  while(l>0) begin
  for(int i=0;i<aa;i++)
    begin
      if(l>0) begin
      a[i+len] = 1;
      l--;
      end
    end
  len = len+aa;
  aa++;
    for(int ii=0;ii<aa;ii++)
    begin
      if(l>0) begin
        a[ii+len] =ab;
      l--;
      end
    end
  len = len+aa;
  aa++;
  ab++;
  end
foreach(a[j]) $display("%d",a[j]); 
endfunction




function pattern_genrator_6 (int length);                       //pattern generator   122333444455555....
  int a[];
  int aa,len,l;
  a= new[length];
  aa=1;
  len=0;
  l=length;
  while(l>0) begin
  for(int i=0;i<aa;i++)
    begin
      if(l>0) begin
        a[i+len] = aa;
      l--;
      end
    end
  len = len+aa;
  aa++;
    for(int ii=0;ii<aa;ii++)
    begin
      if(l>0) begin
        a[ii+len] =aa;
      l--;
      end
    end
  len = len+aa;
  aa++;
  end
foreach(a[j]) $display("%d",a[j]);  
endfunction



module tb;
  
  int length =50;
  
  initial
    begin
//  	pattern_genrator_1(length);
//      length =17;
//    pattern_genrator_1(length);
//      pattern_genrator_2(length);
//      pattern_genrator_3(length);
//      pattern_genrator_4(length);
//      pattern_genrator_5(length);
      pattern_genrator_6(length);
    end
endmodule
