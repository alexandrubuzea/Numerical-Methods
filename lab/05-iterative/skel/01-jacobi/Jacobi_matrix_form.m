function [x, err, steps] = Jacobi_matrix_form(A, b, x0, tol, max_steps)
  
  % matricele N si P din metoda Jacobi
  N = diag(diag(A));
  P = N - A;

  inv_N = inv(N);
  % sau inv_N = diag(ones(n, 1) ./ diag(A)) direct

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
