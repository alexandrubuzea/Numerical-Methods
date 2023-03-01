clc; close all; clear;

n = 10; % numar de teste

for i=1:n
  dim = 10 + 5 * i;
  A = rand(dim, dim);
  [L, D, U] = task2(A);
  assert(istril(L));
  assert(norm(diag(L)) < 1e-10);
  assert(istriu(U));
  assert(norm(diag(U)) < 1e-10);
  assert(isdiag(D));
  assert(norm(A - L - U - D) < 1e-10);
endfor
