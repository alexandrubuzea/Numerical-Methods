function [lambda, err, steps] = shifted_qr_algorithm(A, tol, max_steps)
  steps = 0;
  
  n = length(A);
 
  for i=1:n-2
    z = A(i + 1:n, i);
    v = [zeros(i, 1); z];
    v(i + 1) += sign(z(1)) * norm(z);
    
    H = eye(n) - 2 * v * v' / (v' * v);
    
    A = H * A * H';
  endfor

  disp(A);

  while 1
    E = A(n - 1:n, n - 1:n);
    delta = (E(1, 1) - E(2, 2)) ^ 2 + 4 * E(1, 2)^2;
    l1 = (E(1, 1) + E(2, 2) + sqrt(delta)) / 2;
    l2 = (E(1, 1) + E(2, 2) - sqrt(delta)) / 2;

    [~, index] = min([abs(l1 - E(2, 2)), abs(l2 - E(2, 2))]);
    sigma = [l1, l2](index);

    
    [Q, R] = qr(A - eye(n) * sigma);
    A = R * Q + eye(n) * sigma;
    
    err = norm(A - diag(diag(A)));
    steps++;

    if err < tol || steps == max_steps
      lambda = diag(A);
      disp(A);

      return;
    endif
  endwhile
endfunction
