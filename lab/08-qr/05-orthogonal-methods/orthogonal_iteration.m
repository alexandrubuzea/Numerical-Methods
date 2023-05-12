function [l, Q, steps] = orthogonal_iteration(A, tol, max_steps)
  n = length(A);
  U = rand(n, n);
  prev_Q = U;
  steps = 0;

  while 1
    ++steps;
    [Q, R] = qr(U);
    U = A * Q;
    err = norm(Q - prev_Q);

    if (steps == max_steps || err < tol)
      l = diag(R)';
      return;
    endif
    
    prev_Q = Q;
  endwhile
endfunction
