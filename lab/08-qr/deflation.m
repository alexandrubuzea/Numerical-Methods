function [l, Q, steps] = deflation(A, tol, max_steps)
  B = A;
  steps = 0;
  Q = [];
  l = [];

  n = length(A);

  for i=1:n-1
    dim = n - i + 1;
    [lambda, z, err, steps1] = mpd(B, rand(dim, 1), max_steps, tol);
    steps += steps1;

    v = z;
    v(1) -= sign(z(1)) * norm(z);
    H = eye(dim) - 2 * v * v' / (v' * v);
    
    B = H * B * H';
    l = [l, B(1, 1)];
    
    [lambda, v, err, steps2] = mpid(A, rand(n, 1), max_steps, tol, B(1, 1) + rand() * 1e-2);
    steps += steps2;

    Q = [Q, v];
    
    B = B(2:dim, 2:dim);
  endfor
  
  l = [l, B(1, 1)];
  [lambda, v, err, steps2] = mpid(A, rand(n, 1), max_steps, tol, B(1, 1) + tol);
  steps += steps2;
  Q = [Q, v];

endfunction
