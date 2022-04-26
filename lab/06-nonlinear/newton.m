function [x, err, steps] = newton(f, df, x0, tol, max_steps)
  prev_x = x0;
  steps = 0;
  
  while(1)
    x = prev_x - feval(f, prev_x) / feval(df, prev_x);
    steps++;
    err = abs(x - prev_x);
    if (steps == max_steps || err < tol)
      return;
    endif
    
    prev_x = x;
  endwhile
endfunction
