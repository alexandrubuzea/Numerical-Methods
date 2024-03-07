% linia de igiena
clc; close all; clear;

% definim cele 2 functii care reprezinta ecuatiile sistemului
% nostru neliniar, sub forma:
% x1 = f1(x1, x2)
% x2 = f2(x1, x2)

function [res] = f1(x)
  res = 0.5 * (1 + x(2) + cos(x(1))) ^ (1/2);
endfunction

function [res] = f2(x)
  res = 1/3 * (1 + x(1) + x(2)) ^ (1 / 3);
endfunction

G = cell(2, 1);
G{1} = @f1;
G{2} = @f2;

tol = 1e-20;
max_steps = 1000;

[x, err, steps] = fixed_point(G, zeros(2, 1), tol, max_steps);