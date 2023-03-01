clc; close all; clear;

% ne propunem sa plotam toti vectorii de norma Holder 1 pentru
% cateva norme uzuale

v = [1, 1.5,  2, 3, inf];
colors = ['-r'; '-b'; '-g'; '-k'; '-m'];

figure(1);

title('Unit vectors');
axis([-1.5, 1.5, -1.5, 1.5], "square"); hold on;
grid on;

xlabel('x1');
ylabel('x2');

for i = 1:length(v);
  plot_vectors(v(i), colors(mod(i - 1, length(colors)) + 1, :));
endfor
