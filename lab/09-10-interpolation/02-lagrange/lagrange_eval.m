clc; close all; clear;

f = @(x) (x .* cos(x));

a = 0;
b = 5;
n = input('Cate puncte folosim la esantionare ? n = ');

xx = linspace(a, b, n);
yy = f(xx);

n_plot = 1000;

xx_in = linspace(a, b, n_plot);
yy_out = lagrange(xx, yy, xx_in);

yy_ref = f(xx_in);

figure(1);
plot(xx_in, yy_out, 'LineWidth', 3.0, 'color', 'r'); hold on;
plot(xx_in, yy_ref, 'LineWidth', 1.5, 'color', 'b'); hold on;
title("Interpolare Lagrange"); hold on;
legend('Lagrange interpolation', 'Real graph', 'location', 'Northeast'); hold on;