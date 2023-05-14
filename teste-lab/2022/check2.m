clc; close all; clear;

load "params.mat"

n = length(A);
tol = 1e-10;
max_steps = 500;

for i=1:n
  m = length(A{i});
  [lambda, x, err, steps] = ex2(A{i}, ones(m, 1), 1e-10, max_steps);
  ro = max(abs(eig(A{i})));
  
  if (err > 1e-5)
    disp(["TEST ", num2str(i), " FAILED"]);
    disp(["Expected result: ", num2str(ro)]);
    disp(["Actual result: ", num2str(lambda)]);
    disp(["Error: ", num2str(abs(ro - lambda))]);
  else
    disp(["TEST ", num2str(i), " PASSED"]);
  endif

endfor
