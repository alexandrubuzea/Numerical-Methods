clc; close all; clear;

f = @(x) (x .* cos(x));

a = 0;
b = 5;
n = 20;

xx = linspace(a, b, n);

yy = f(xx);

coef = vandermonde(xx, yy);

figure(1);
plot(xx, polyval(coef, xx), 'LineWidth', 1.5, 'color', 'r'); hold on;
plot(xx, yy, 'LineWidth', 1.5, 'color', 'b'); hold on;
title("Interpolare Vandermonde");