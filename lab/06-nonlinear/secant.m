function [x, err, steps] = secant(f, x0, x1, tol, max_steps)
  prev_x = x1;
  prev_prev_x = x0;
  
  steps = 0;
  
  while(1)
    df = (feval(f, prev_x) - feval(f, prev_prev_x)) / (prev_x - prev_prev_x);
    
    x = prev_x - feval(f, prev_x) / df;
    
    err = norm(x - prev_x);
    steps++;
    
    if (steps == max_steps || err < tol)
      return;  
    endif
    
    prev_prev_x = prev_x;
    prev_x = x;
  endwhile
endfunction
