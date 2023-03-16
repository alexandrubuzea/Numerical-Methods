clc; close all; clear;

task1;

load "task1.mat";

tol = 1e-10;

assert(norm(z - x - i * y) < tol);
assert(norm(z_mod - sort(sqrt(x.^2 + y.^2))) < tol);
assert(!isnan(z_mod));
assert(isreal(z_mod));
assert(issorted(z_mod));