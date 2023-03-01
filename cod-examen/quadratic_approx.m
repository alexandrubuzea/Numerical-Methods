function [a] = quadratic_approx(x, y)
  % x este vectorul absciselor punctelor
  % y este vectorul ordonatelor punctelor
  
  % alocam vector de 5 zerouri - pentru sum(xk ^ i)
  % cu i de la 0 la 4 (inclusiv)
  S = zeros(1, 5);
  
  for i = 1:5
    S(i) = sum(x .^ (i - 1));
  endfor
  
  % avem n = 2 ("interpolare" in sensul CMMP
  % cu polinom de grad 2)
  % deci vom avea sistem 3x3
  
  b = zeros(3, 1);
  
  % vectorul termenilor liberi, in care vom pune sumele
  for i = 1:3
    b(i) = sum(y .* (x .^ (i - 1)));
  endfor
  
  % matricea sistemului, in care vom pune sumele
  A = zeros(3);
  for i = 1:3
    for j = 1:3
      A(i,j) = S(i + j - 1);
    endfor
  endfor
  
  a = A \ b;
endfunction
