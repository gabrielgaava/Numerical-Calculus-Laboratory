// Converte parte Inteira
function [result] = intBase10ToBase2(n)

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


// Converte parte Decimal
function [result] = decBase10ToBase2(n)

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

x = decBase10ToBase2(0.84375)
y = decBase10ToBase2(0.4)








