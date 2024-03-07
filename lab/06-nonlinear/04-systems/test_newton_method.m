% linia de igiena
clc; close all; clear;

% definim cele 2 functii care reprezinta ecuatiile sistemului
% nostru neliniar, sub forma:
% 0 = f1(x1, x2)
% 0 = f2(x1, x2)

function [res] = f1(x)
  res = -x(2) + 1/4 * x(1)^2 - 3/2 * x(1) + 9/4;
endfunction

function [res] = f2(x)
  res = x(1) ^ 2 + x(2) ^ 2 - 2;
endfunction

G = cell(2, 1);
G{1} = @f1;
G{2} = @f2;

tol = 1e-10;
max_steps = 1000;

[x, err, steps] = newton_system_method(G, zeros(2, 1), tol, max_steps);

% observam ca rezultatul este bun, desi avem probleme cu calculul
% matricei jacobiene (calculul aproximativ al derivatelor produce
% matrice rau conditionate)