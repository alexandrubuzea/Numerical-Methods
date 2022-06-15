function S = richardson_ten(f, a, b)
  % metoda trapezelor : O(h^2)
  % cum ajungem la O(h^10) ? Cu extrapolare richardson / integrare
  % romberg !!
  
  S = zeros(5, 1);
  
  % aici trebuia de regula cu formula de recurenta
  % pentru h -> h/2 (de adunat doar suma triunghiurilor care
  % raman, dar pentru simplitate/claritate am facut cu
  % recalculare
  for i = 1:5
    S(i) = trapezoidal(f, a, b, 2 ^ (i - 1));
  endfor
  
  for j = 2:5
    len = length(S);
    prev_S = S;
    S = (4 ^ (j - 1) * prev_S(2:len) - prev_S(1:len-1)) / (4 ^ (j - 1) - 1);
  endfor
endfunction
