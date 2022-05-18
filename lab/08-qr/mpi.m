function [lambda, x, err, steps] = mpi(A, x0, max_steps, tol)
  x = x0;
  x /= norm(x);
  steps = 0;
  
  while(1)
    prev_x = x;
    steps++;
    x = A \ x;
    x /= norm(x);
    
    err = norm(x - prev_x);
    
    if (err < tol || steps == max_steps)
      lambda = x' * A * x;
      return;
    endif
  endwhile
endfunction
