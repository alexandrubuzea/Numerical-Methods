function [coef] = vandermonde(xx, yy)
  n = length(xx) - 1;
  A = zeros(n + 1, n + 1); % initializare / alocare de memorie
  
  A(:, 1) = 1;
  
  if length(xx) == size(xx, 2)
    xx = xx';
  endif
  
  if length(yy) == size(yy, 2)
    yy = yy';
  endif
  
  for i = 2:n
    A(:, i) = A(:, i - 1) .* xx;
  endfor

  coef = A \ yy;
  coef = flip(coef); % sa avem coeficientii in ordinea
  % descrescatoare a gradelor

endfunction