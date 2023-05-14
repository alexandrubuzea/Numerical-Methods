clc; close all; clear;

load "params.mat"

n = length(A);

max_steps = 10000;
tol = 1e-7;

for i=1:n
  [lb, steps] = ex1(A{i}, max_steps, tol);
  err = norm(sort(eig(A{i})) - sort(lb));

  if (err > 1e-5)
    disp(["TEST ", num2str(i), " FAILED"]);
    disp(["Expected result: ", num2str(sort(lb)')]);
    disp(["Actual result: ", num2str(sort(eig(A{i}))')]);
    disp(["Error: ", num2str(err)]);
  else
    disp(["TEST ", num2str(i), " PASSED"]);
  endif
endfor
