clc; close all; clear;

n = 20;

sizes = [];

err_gs = [];
err_gv = [];
err_hh = [];

time_gs = [];
time_gv = [];
time_hh = [];

for i = 1:n
  new_size = 2^(3 + i / 4) * (0.5 + rand() / 2);
  new_size = round(new_size);
  sizes = [sizes, new_size];
endfor

for i=1:n
  A = rand(sizes(i), sizes(i));

  tic;
  [Q, R] = gram_schmidt(A);
  tmp = toc();
  err = norm(A - Q * R);
  err_gs = [err_gs, err];
  time_gs = [time_gs, tmp];
  
  tic;
  [Q, R] = givens(A);
  tmp = toc();
  err = norm(A - Q * R);
  err_gv = [err_gv, err];
  time_gv = [time_gv, tmp];
  
  tic;
  [Q, R] = householder(A);
  tmp = toc();
  err = norm(A - Q * R);
  err_hh = [err_hh, err];
  time_hh = [time_hh, tmp];
endfor

figure(1);
title('Timpii de rulare pentru cele 3 metode de factorizare QR');
plot(sizes, log(time_gs), "o",'Markersize', 10, 'LineWidth', 2); hold on;
plot(sizes, log(time_gv), "o",'Markersize', 10, 'LineWidth', 2); hold on;
plot(sizes, log(time_hh), "o",'Markersize', 10, 'LineWidth', 2); hold on;
legend('Gram-Schmidt', 'Givens', 'Householder');

figure(2);
title('Stabilitatea numerica pentru cele 3 metode de factorizare QR');
plot(sizes, log(err_gs), "o",'Markersize', 10, 'LineWidth', 2); hold on;
plot(sizes, log(err_gv), "o",'Markersize', 10, 'LineWidth', 2); hold on;
plot(sizes, log(err_hh), "o",'Markersize', 10, 'LineWidth', 2); hold on;
legend('Gram-Schmidt', 'Givens', 'Householder');