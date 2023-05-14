clc; close all; clear;

load "params.mat"

n = length(bases);
tol = 1e-10;
max_steps = 500;

for i=1:n
  out = ex3_bonus(bases(i), exps(i), tol, max_steps);
  ref = bases(i) ^ (1 / exps(i));
  
  if (abs(out - ref) > tol)
    disp(["TEST ", num2str(i), " FAILED"]);
    disp(["Expected result: ", num2str(ref)]);
    disp(["Actual result: ", num2str(out)]);
    disp(["Error: ", num2str(abs(out - ref))]);
  else
    disp(["TEST ", num2str(i), " PASSED"]);
  endif
endfor
