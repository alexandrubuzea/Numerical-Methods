function [x] = SST(A, b)
  % o functie care rezolva un sistem superior triunghiular
  % se garanteaza ca A este matrice patratica

  if (norm(A - triu(A)) > 1e-10)
    x = NaN;
    return
  endif
  
  if (size(A, 1) != size(A, 2))
    x = NaN;
    return
  endif
  
  n = length(A);
  x = zeros(n, 1);
  
  for i=n:-1:1
    x(i) = (b(i) - A(i, i+1:n) * x(i+1:n))/ A(i,i);
  endfor

endfunction