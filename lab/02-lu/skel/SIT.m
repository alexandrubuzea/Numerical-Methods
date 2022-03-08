function [x] = SIT(A, b)
  % o functie care rezolva un sistem inferior triunghiular
  % se garanteaza ca A este matrice patratica

  if (norm(A - tril(A)) > 1e-10)
    x = NaN;
    return
  endif
  
  if (size(A, 1) != size(A, 2))
    x = NaN;
    return
  endif
  
  n = length(A);
  x = zeros(n, 1);
  
  for i=1:n
    x(i) = (b(i) - A(i, 1:i-1) * x(1:i-1))/ A(i,i);
  endfor

endfunction