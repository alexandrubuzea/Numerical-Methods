clc; close all; clear;

n = 20;
sizes = [];

for i = 1:n
  new_size = 2^(4 + i / 4) * (0.5 + rand() / 2);
  new_size = round(new_size);
  sizes = [sizes, new_size];
endfor

err = 1e-10;

ws = [0, 1, 0.3, 0.8, 1.1, 1.5, 1.9];

steps = zeros(n, length(ws));
max_steps = 200;

for i = 1:n
  A = rand(sizes(i), sizes(i));
  b = rand(sizes(i), 1);
  
  A += sizes(i) * eye(sizes(i));
  
  for j = 1:length(ws)
    w = ws(j);
    for z=1:1
    switch (w)
      case 0
        [~, ~, steps(i, j)] = Jacobi_matrix_form(A, b, zeros(sizes(i), 1), err, max_steps);
      case 1
        [~, ~, steps(i, j)] = GS_matrix_form(A, b, zeros(sizes(i), 1), err, max_steps);
      otherwise
        [~, ~, steps(i, j)] = SOR_matrix_form(A, b, zeros(sizes(i), 1), w, err, max_steps);
    endswitch
    endfor
  endfor
endfor

figure(1);
title('Numar de pasi in functie de metoda'); hold on;
xlabel('Dimensiunea matricei de lucru'); hold on;
ylabel('Numarul de pasi efectuati'); hold on;
axis([0, 550, 0, 220]);

legend_info = {};

for j=1:length(ws)
  w = ws(j);
  plot(sizes, steps(:, j), "o", 'Markersize', 10, 'LineWidth', 2); hold on;
  str = "";
  switch(w)
    case 0
      str = "Jacobi";
    case 1
      str = "Gauss-Seidel";
    otherwise
      str = ["SOR cu w = ", num2str(w)];
  endswitch
  legend_info{j} = str;
endfor
legend(legend_info);
clear _;