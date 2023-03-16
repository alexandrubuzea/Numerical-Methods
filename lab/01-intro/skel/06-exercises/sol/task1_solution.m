clc; close all; clear;

% initializari

x = 10 * rand(1, 100) - 5;
y = 10 * rand(1, 100) - 5;

% TODO 1: obtine un vector cu numere complexe z, cu partea reala x si
% cea imaginara y. Hint: vectorizare

z = x + i * y;

% TODO 2: Ce face operatorul ' asupra lui x ? Dar asupra lui z ?

% x -> x' este transpusa vectorului (un vector coloana)
% z -> z' este adjuncta hermitica (vector coloana cu elementele
% conjugate)

% TODO 3: sorteaza numerele complexe dupa modul (numele vectorului
% va fi z_mod si va contine acele module, sortate crescator)

z_mod = abs(z);
z_mod = sort(z_mod);

% TODO 4: salveaza rezultatele (x, y, z si z_mod) intr-un fisier
% cu numele task1.mat

save "task1.mat" x y z z_mod
% Pentru verificare ruleaza assert1.m in consola.