clc; close all; clear;

v = rand(2,1) * 2 - 1;

v /= norm(v, 2);
v *= 2; % vector de norma euclidiana 2

figure(1);

axis([-2.5, 2.5, -2.5, 2.5], "square"); hold on;

quiver(0, 0, v(1), v(2), 'MaxHeadSize', 0.05); hold on;
text(1.1 * v(1), 1.1 * v(2), 'v');
plot_circle(norm(v), 0, 2*pi);

angle = rand() * 2 * pi;
G = [cos(angle), - sin(angle); sin(angle), cos(angle)];

v_arg = arg([1, i] * v);

v = G * v;

if v_arg < 0
  v_arg += 2*pi;
endif

plot_circle(norm(v) / 5, v_arg, mod(v_arg + angle, 2 * pi));

quiver(0, 0, v(1), v(2), 'MaxHeadSize', 0.05); hold on;
text(1.1 * v(1), 1.1 * v(2), 'Gv');
text(2, 2, ['angle = ', num2str(round(angle / pi * 180)), ' degrees']);
text(2, -1.7, 'G = ');
text(2, -2, [num2str(G)]);