function [lambda, x, err, steps] = power_method(A, x0, max_steps, tol)
  steps = 0;
  
  prev_x = x0;
  
  while 1
    x = A * prev_x;
    x /= norm(x);
 
    steps++;
    
    err = norm(x - prev_x);

    if steps == max_steps || err < tol
      lambda = x' * A * x;
      return;
    endif
    
    prev_x = x;
  endwhile
endfunction
