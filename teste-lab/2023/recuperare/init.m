clc; close all; clear;

% DO NOT TOUCH
% se genereaza un numar de 6 matrice simetrice, pentru testare
% use them well

n = 5:10;
index = 1;

for i=n
  tmp = rand(i, i);
  A{index} = (tmp + tmp') / 2;
  index++;
endfor

save "params.mat" A