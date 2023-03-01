function [a] = cubic_approx(x, y)
  % x este vectorul absciselor punctelor
  % y este vectorul ordonatelor punctelor
  
  % alocam vector de 9 zerouri - pentru sum(xk ^ i)
  % cu i de la 0 la 8 (inclusiv)
  S = zeros(1, 9);
  
  for i = 1:9
    S(i) = sum(x .^ (i - 1));
  endfor
  
  % avem n = 3 ("interpolare" = aproximatie in sensul CMMP
  % cu polinom de grad 3)
  % deci vom avea sistem 4x4
  
  b = zeros(4, 1);
  
  % vectorul termenilor liberi, in care vom pune sumele
  for i = 1:4
    b(i) = sum(y .* (x .^ (i - 1)));
  endfor
  
  % matricea sistemului, in care vom pune sumele
  A = zeros(4);
  for i = 1:4
    for j = 1:4
      A(i,j) = S(i + j - 1);
    endfor
  endfor
  
  a = A \ b;
endfunction
