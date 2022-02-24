clc; close all; clear;

% initializam variabila a cu valoarea 3
% in consola se va afisa a = 3
a = 3

% modificam valoarea lui a
% nu se va afisa nimic la consola (am folosit ;)
a = 5;

% afisam valoarea lui a, prin simpla instantiere
a

% initializam un vector linie - cu , sau cu spatiu
v = [1, 2, 3, 4];

% vector coloana - cu ;
x = [1; 2; 3; 4];

% matrice - folosim , pentru separarea pe linie si ; pentru
% separarea pe coloana
matrix = [1, 2, 3, 4; 5, 6, 7, 8];

v2 = [1:100]; % vector cu 100 de elemente consecutive, de la 1 la 100
v3 = [1:2:100]; % vector cu elemente de la 1 la 100, din 2 in 2

% va returna un vector cu 2 elemente
% numar de linii + numar de coloane
size_v2 = size(v2);

% va returna lungimea vectorului dat ca parametru
% daca dam matrice, va returna dimensiunea mai mare dintre
% cele 2 dimensiuni disponibile
length_matrix = length(matrix);