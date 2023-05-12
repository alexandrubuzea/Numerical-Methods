function [l, Q, steps] = wielandt_deflation(A, tol, max_steps)
  l = [];
  Q = [];
  
  n = length(A);
  steps = 0;

  B = A;

  for i=1:n
    [lambda, v_B, ~, curr_steps] = mpd(B, rand(n, 1), max_steps, tol);
    steps += curr_steps;

    [lambda, v_A, ~, curr_steps] = mpid(A, rand(n, 1), max_steps, tol, lambda + rand() * tol);
    l = [l, lambda];
    Q = [Q, v_A];
    steps += curr_steps;
    
    [~, index] = max(abs(v_B));
    
    x = B(index, :)' / (lambda * v_B(index));

    B -= lambda * v_B * x';
  endfor

endfunction
