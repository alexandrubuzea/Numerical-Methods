clc; close all; clear;

tol = 1e-5;
max_steps = 200;

x0 = rand(2, 1);
A = rand(2, 2);

[T, D] = eig(A);
T(:, 1) /= norm(T(:, 1));
T(:, 2) /= norm(T(:, 2));

figure(1);
plot([0, T(1, 1)], [0, T(2, 1)], 'LineWidth', 4, 'color', 'r'); hold on;
plot([0, T(1, 2)], [0, T(2, 2)], 'LineWidth', 4, 'color', 'r'); hold on;

prev_x = x0;

steps = 0;
while 1
  x = A * prev_x;
  x /= norm(x);
  
  plot([0, x(1)], [0 x(2)], 'LineWidth', 1, 'color', 'b'); hold on;

  steps++;
  err = norm(x - prev_x);

  if err < tol || steps == max_steps
    return;
  endif
  
  prev_x = x;
endwhile
