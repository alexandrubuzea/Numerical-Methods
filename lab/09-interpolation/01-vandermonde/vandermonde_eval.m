clc; close all; clear;

f = @(x) (x .* cos(x));

a = 0;
b = 5;

n = input('Cu cate puncte esantionam ? n = ');

% luam un numar de valori n mic folosit la interpolare
xx = linspace(a, b, n);
yy = f(xx);

% luam un numar mai mare de valori pentru a reprezenta
% originalul + polinomul de interpolare

coef = vandermonde(xx, yy);

% plot stuff
n_plot = 1000;
xx_in = linspace(a, b, n_plot);
yy_out = polyval(coef, xx_in);
yy_ref = f(xx_in);

figure(1);
plot(xx_in, yy_out, 'LineWidth', 1.5, 'color', 'r'); hold on;
plot(xx_in, yy_ref, 'LineWidth', 1.5, 'color', 'b'); hold on;
title("Interpolare Vandermonde"); hold on;
legend('Vandermonde interpolation', 'Real graph', 'location', 'Northeast'); hold on;