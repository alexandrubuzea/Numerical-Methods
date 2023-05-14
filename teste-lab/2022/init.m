clc; close all; clear;

% DO NOT TOUCH

name = input("Introduceti numele/ID-ul de moodle (intre ghilimele): ");

n = 5:10;
index = 1;

for i=n
  tmp = rand(i, i);
  A{index} = (tmp + tmp') / 2;
  index++;
endfor

exps = 2:11;
m = length(exps);

bases = (1 + randperm(100))(1:m);

save "params.mat" name A bases exps