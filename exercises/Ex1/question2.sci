function [result] = fracBinaryToDecimal(n)
  result = 0
  
  t = string(n)
  len = length(t)
  
  // Finding the index of the '.'.
  dot = strindex(t, '.')
  
  // Set aux value to the max decimal value possíble for a binary.
  if (dot) then
      aux = 2**(dot - 2)
  else
      aux = 2**(len - 1)
  end
  
  // Remove the dot from the string to correct math.
  t = strsubst(t, '.', '')
  
  disp(aux)
  
  for i = 1:len
      if (part(t, i) == '1') then
          result = result + aux
      end
      
      aux = aux / 2
  end
  
endfunction

x = fracBinaryToDecimal("0.10111")
y = fracBinaryToDecimal("0.1010101")
y = fracBinaryToDecimal("101.1")