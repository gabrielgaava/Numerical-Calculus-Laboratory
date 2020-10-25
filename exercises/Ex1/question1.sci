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

  result = ""
  
  while n ~= 0
    if n * 2 >= 1 then
      result = "1" + result 
      
    else
       result = "0" + result
  
    end
    n = (n * 2) - int(n * 2)
  
  end

endfunction


function [result] = base10ToBase2(n)
  
  decPart = n - int(n)
  intPart = n - decPart

  intString = ""
  decString = ""

  if n > 1
    intString = intBase10ToBase2(intPart)
    decString = decBase10ToBase2(decPart)

  else
    intString = "0"
    decString = decBase10ToBase2(decPart)
  end

  result = intString + "." + decString


endfunction

x = base10ToBase2(0.84375)
y = base10ToBase2(0.4)
z = base10ToBase2(5.55)