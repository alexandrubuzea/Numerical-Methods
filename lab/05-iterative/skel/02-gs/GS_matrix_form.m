function [x, err, steps] = GS_matrix_form(A, b, x0, tol, max_steps)
  
  % matricele N si P din metoda Gauss Seidel
  N = tril(A);
  P = N - A;
  
  % inversa lui N -> N este inferior triunghiulara, deci inversa
  % este usor de calculat

  inv_N = inv(N);
  
  % matricea + vectorul de iteratie GS
  G = inv_N * P;
  c = inv_N * b;

  prev_x = x0;
    
  steps = 0;
  while 1
    x = G * prev_x + c;
        
    err = norm(x - prev_x);
        
    steps++;
    if (steps == max_steps) || (err < tol)
      return;
    endif
        
    prev_x = x;
  endwhile

endfunction