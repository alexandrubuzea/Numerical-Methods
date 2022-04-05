function [sol, err, steps] = bisection(f, a, b, tol, max_steps)
  steps = 0;
  
  while 1
    steps++;

    c = (a + b) / 2;
    
    if f(c) * f(a) < 0
      b = c;
    else
      a = c;
    endif
    
    err = b - a;
    
    if err < tol || steps == max_steps
      sol = c;
      return;
    endif
    
  endwhile

endfunction
