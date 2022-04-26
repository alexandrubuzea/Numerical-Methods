function [l, T, total_steps] = orthogonal_power_method(A, tol, max_steps)
  T = [];
  l = [];
  n = length(A);

  total_steps = 0;

  for i=1:n
    x = rand(n, 1);
    x /= norm(x);
    steps = 0;
    while 1
      steps++;
      prev_x = x;
      x = A * x;
      
      for j = 1:i-1
        x -= (x' * T(:, j)) * T(:, j);        
      endfor

      x /= norm(x);
      err = norm(x - prev_x);

      if (steps == max_steps || err < tol)
        T = [T, x];
        l = [l, x' * A * x];
        total_steps += steps;
        break;
      endif
    endwhile
  endfor

endfunction
