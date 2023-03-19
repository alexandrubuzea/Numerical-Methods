clc; close all; clear;

n = 20;
sizes = [];
eigs = [];

for i = 1:n
  new_size = 2^(4 + i / 4) * (0.5 + rand() / 2);
  new_size = round(new_size);
  sizes = [sizes, new_size];
endfor

err = 1e-10;

max_steps = 200;

results_jacobi = [];
results_gs = [];
results_sor = [];

for i = 1:n
  A = diag(rand(sizes(i), 1)) + diag(rand(sizes(i) - 1, 1), -1);
  A += eye(sizes(i));
  A = A * A';
  b = rand(sizes(i), 1);
  
  N = diag(diag(A));
  P = N - A;
  G = inv(N) * P;
 
  ro = sort(abs(eig(G)))(sizes(i));
  
  w = 2 / (1 + sqrt(1 - ro^2));
  
  [~, ~, num_steps] = Jacobi_matrix_form(A, b, zeros(size(b)), err, max_steps);
  results_jacobi = [results_jacobi, num_steps];
  
  [~, ~, num_steps] = GS_matrix_form(A, b, zeros(size(b)), err, max_steps);
  results_gs = [results_gs, num_steps];
  
  [~, ~, num_steps] = SOR_matrix_form(A, b, zeros(size(b)), w, err, max_steps);
  results_sor = [results_sor, num_steps];
endfor

figure(1);
title('Numar de pasi pentru A pozitiv definita');
axis([0, 550, 0, 220]);

plot(sizes, results_jacobi, "o",'Markersize', 10, 'LineWidth', 2); hold on;
plot(sizes, results_gs, "o", 'Markersize', 10, 'LineWidth', 2); hold on;
plot(sizes, results_sor, "o", 'Markersize', 10, 'LineWidth', 2); hold on;

legend('Jacobi', 'Gauss-Seidel', 'SOR optimal');