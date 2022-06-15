function [S] = romberg_trapezoidal(f, a, b, n)
  % construim prima coloana din triunghiul Romberg
  S = zeros(n + 1, 1);
  
  % plecam de la cazul de baza
  for i=1:n+1
    S(i) = trapezoidal(f, a, b, 2 ^ (i - 1));
  endfor
  
  % recurenta - puteam si fara len, dar e mai usor de inteles asa
  % len se poate deduce din n si j
  for j = 2:n+1
    len = length(S);
    prev_S = S;
    S = (4 ^ (j - 1) * prev_S(2:len) - prev_S(1:len-1)) / (4 ^ (j - 1) - 1);
  endfor
endfunction
