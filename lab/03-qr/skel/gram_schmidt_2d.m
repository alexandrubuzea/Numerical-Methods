clc; close all; clear;

G = 1/10 * [0 -1; 1 0];

figure(1);
grid on; hold on;
axis([-3, 3, -3, 3], "square"); hold on;
a = rand();
a = pi / 4 * a;

v1 = [cos(a), -sin(a); sin(a), cos(a)] * [2; 0];

a = rand();
a = pi / 4 * a + pi / 4;

v2 = [cos(a), -sin(a); sin(a), cos(a)] * [3; 0];

quiver(0, 0, v1(1), v1(2), 'MaxHeadSize', 0.05, '-r'); hold on;
c = 0.9 * v1 + G * v1;
text(c(1), c(2), 'v1');

quiver(0, 0, v2(1), v2(2), 'MaxHeadSize', 0.05, '-b'); hold on;
c = 0.9 * v2 + G * v2;
text(c(1), c(2), 'v2');

figure(2);
grid on; hold on;

axis([-3, 3, -3, 3], "square"); hold on;
quiver(0, 0, v1(1), v1(2), 'MaxHeadSize', 0.05, '-r'); hold on;
c = 0.9 * v1 + G * v1;
text(c(1), c(2), 'v1');
quiver(0, 0, v2(1), v2(2), 'MaxHeadSize', 0.05, '-b'); hold on;
c = 0.9 * v2 + G * v2;
text(c(1), c(2), 'v2');

q1 = v1 / norm(v1);
quiver(0, 0, q1(1), q1(2), 'MaxHeadSize', 0.05, '-k', 'LineWidth', 2);
c = 0.9 * q1 + G' * q1;
text(c(1), c(2), 'q1');

proj = (v2' * v1) / (v1' * v1) * v1;
quiver(0, 0, proj(1), proj(2), 'MaxHeadSize', 0.05, '-k', 'LineWidth', 0.5); hold on;
c = 0.9 * proj + G' * proj;
text(c(1), c(2), 'proj');

plot(0.9 * [proj(1), v2(1)], 0.9 * [proj(2), v2(2)], 'LineWidth', 0.5, '-k', 'LineStyle', '--');
plot(0.9 * [v2(1) - proj(1), v2(1)], 0.9 * [v2(2) - proj(2), v2(2)], 'LineWidth', 0.5, 'LineStyle', '--', '-k'); hold on;
v2 -= proj;
quiver(0, 0, v2(1), v2(2), 'MaxHeadSize', 0.05, '-k');
c = 0.9 * v2 + 2 * G * v2;
text(c(1), c(2), 'v2 - proj');

q2 = v2 / norm(v2);
quiver(0, 0, q2(1), q2(2), 'MaxHeadSize', 0.05, '-k', 'LineWidth', 2);
c = 0.9 * q2 + 2 * G * q2;
text(c(1), c(2), 'q2');