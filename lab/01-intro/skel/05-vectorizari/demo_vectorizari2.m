clc; close all; clear

% de asemenea, functiile din Octave sunt implementate vectorizat

n = 1e6;
x = linspace(0, 2 * pi, n);

tic;
y_vect = sin(x);
time_1 = toc();

y_nevect = zeros(1, n);
tic;
for i=1:length(x)
  y_nevect(i) = sin(x(i));
endfor
time_2 = toc();

disp(['Functie cu vectorizare: ', num2str(time_1), ' s']);
disp(['Functie fara vectorizare: ', num2str(time_2), ' s']);
