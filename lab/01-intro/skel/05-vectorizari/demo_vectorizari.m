clc; close all; clear;

% ne propunem sa facem produsul scalar in 2 moduri, vectorizat
% si nevectorizat

% luam o valoare a lui n rezonabila -> sa nu dureze scriptul prea mult
% approx. 20 de secunde
n = 1e6;

v = rand(n, 1);
w = rand(n, 1);

% pornim ceasul sistemului - vectorizat
tic;
dot_product_1 = v' * w;
time_1 = toc();

% pornim ceasul sistemului - nevectorizat
tic;
dot_product_2 = 0;

for i=1:n
  dot_product_2 += v(i) * w(i);
endfor

time_2 = toc();

disp(['Cu vectorizare: ', num2str(time_1), ' s']);
disp(['Fara vectorizare: ', num2str(time_2), ' s']);