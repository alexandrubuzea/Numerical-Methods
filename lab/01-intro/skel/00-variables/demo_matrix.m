clc; close all; clear;

% avem o matrice cu elemente random intre 1 si 10, intregi
mat = round(10 * rand(5,7));

% luam doar primele 3 linii din matrice, si toate coloanele
mat_1 = mat([1:3], :);

% luam liniile 1, 3 si 5 (pas 2) si coloanele de la 4 la 7 in ordine
% inversa
mat_2 = mat([1:2:5], [7:-1:4]);

% pentru urmatoarele 4 comenzi -> parametrii sunt doar dimensiuni

% matricea identitate
identity = eye(10);

% matrice plina de zerouri
all_zeros = zeros(4,3);

% matrice plina de valori de 1
all_ones = ones(3,7);

% matrice plina de valori random intre 0 si 1
all_random = rand(3,2);

% operatii cu matrice:

% luam 2 matrice random si le inmultim
a = rand(4,5);
b = rand(5,6);
c = a * b;

% operatori Hadamard
d = a .* b(1:4, 1:5);

% operator normal vs Hadamard. Observati diferenta ?
example = [1, 2; 3, 4];
example_1 = example ^ 2;
example_2 = example .^ 2;