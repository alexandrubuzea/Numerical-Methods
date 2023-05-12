function [lambda, x, err, steps] = inverse_power_method(A, x0, tol, max_steps, mu)
  steps = 0;
  
  prev_x = x0;
  
  n = length(A);

  while 1
    % x = A * prev_x -> MPD
    % x = (A - mu * I)^-1 * prev_x -> MPI
    % (A - mu * I) * x = prev_x
    
    x = (A - mu * eye(n)) \ prev_x;
    x /= (norm(x) * sign(x(1)));
    
    err = norm(x - prev_x);
    steps++;
    if err < tol || steps == max_steps
      lambda = x' * A * x;
      return;
    endif
    
    prev_x = x;
  endwhile
  
endfunction
