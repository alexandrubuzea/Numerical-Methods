function [lambda, x, err, steps] = mpid(A, x0, max_steps, tol, alpha)
  n = length(A);
  [lambda, x, err, steps] = mpi(A - alpha * eye(n), x0, max_steps, tol);
  lambda += alpha;
endfunction