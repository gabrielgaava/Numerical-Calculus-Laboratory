// Inteiro
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


// Decimal
function [result] = base10ToBase2(n)

  result = ")"
  
  while n ~= 0
    if n * 2 >= 1 then
      result = "1" + result 
      
    else
       result = "0" + result
  
    end
    n = (n * 2) - int(n * 2)
  
  end

  result = "(." + result

endfunction







