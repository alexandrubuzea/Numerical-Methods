function [lambda, err, steps] = qr_algorithm(A, tol, max_steps)
  steps = 0;

  while 1
    [Q, R] = qr(A);
    A = R * Q;
    err = norm(A - diag(diag(A)));
    steps++;

    if err < tol || steps == max_steps
      lambda = diag(A);
      disp(A);

      return;
    endif
  endwhile
endfunction
