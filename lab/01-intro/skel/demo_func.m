clc; close all; clear;

% cum putem folosi o functie ? O scriem intr-un fisier separat
% si o apelam aici

% distribution -> face media si abaterea medie patratica pentru
% o variabila aleatoare
% observam ca putem avea mai multe valori de return (chiar si tablouri)
x = rand(1, 100);
[mean_x, stddev] = distribution(x);

% parametrii prin referinta / valoare ?

disp(['Length of x is ', num2str(length(x))]);
modify_vector(x);
disp(['Length of x is ', num2str(length(x))]);

% concluzia ?
% orice vrem sa modificam -> trebuie sa returnam ca parametru !
% functii void (vezi sintaxa la modify_vector) -> se folosesc de
% obicei pentru printare/plot