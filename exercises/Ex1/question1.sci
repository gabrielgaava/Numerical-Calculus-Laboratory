function [result] = base10ToBase2(n)

  result = ""
  
  while n > 0
    if modulo(n,2) == 1 then
      result = "1" + result 
      
    else
       result = "0" + result
  
    end
    n = int(n / 2);
  
  end

endfunction

Base10 = 55
Base2 = base10ToBase2(Base10)