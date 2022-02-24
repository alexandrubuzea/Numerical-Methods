clc; close all; clear;

x = magic(14);

% salvam variabila x intr-un fisier .mat
save "my_parameters.mat" x;

% stergem din workspace variabila x
clear x;
load "my_parameters.mat";

% deschidem fisierul pentru write (C-style)
fid = fopen("gigel.txt", "wt");

fprintf(fid, "%d ", uint32(x), size(x));

% neaparat inchidem fisierul, altfel nu se vor salva modificarile
% comportament incorect
fclose(fid);