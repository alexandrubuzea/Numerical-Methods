clc; close all; clear;

v = rand(2, 1);
v /= norm(v);
v *= 2;

figure(1);
axis([-2, 2, -2, 2], "square"); hold on;

quiver(0, 0, v(1), v(2), 'MaxHeadSize', 0.05, '-r'); hold on;
quiver(0, 0, norm(v), 0, 'MaxHeadSize', 0.05, '-r'); hold on;
plot(0.9 * [v(1), norm(v)], 0.9 * [v(2), 0], 'LineWidth', 2, 'LineStyle', '--', '-k'); hold on;
x = [0, 2];
y = tan(atan(v(2) / v(1)) / 2) * x;
plot(x, y, 'LineWidth', 2, 'LineStyle', '--', '-k'); hold on;
text(1.8, -0.1, '||z|| e1');
text(1.8, 0.1, 'v');
text(0.9 * (v(1) - 0.05 * v(2)), 0.9 * (v(2) + 0.05 * v(1)), 'z');

quiver(0, 0, -norm(v), 0, 'MaxHeadSize', 0.05, '-b'); hold on;
plot(0.9 * [v(1), -norm(v)], 0.9 * [v(2), 0], 'LineWidth', 2, 'LineStyle', '--', '-k'); hold on;

x = [-2, 0];
y = tan(pi/2 + 1/2 * atan(v(2) / v(1))) * x;
plot(x, y, 'LineWidth', 2, 'LineStyle', '--', '-k'); hold on;
text(-1.8, -0.1, '-||z|| e1');
text(-1.8, 0.1, 'v+');