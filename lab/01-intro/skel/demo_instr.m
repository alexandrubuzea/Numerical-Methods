clc; close all; clear;

% instructiunea if - la fel ca in C/C++ (nu sunt necesare parantezele)
% in loc de acolade avem endif.
a = round(rand() * 10);

if a >= 5
  disp(['You won a prize!']);
else
  disp(['Unlucky !']);
endif

secret_password = "lab1MN";
password = input('Parola secreta (intre ghilimele): ');

if strcmp(password, secret_password) == 1
  disp('Done with the lab !');
else
  disp('Try again !');
endif

% for similar cu C/C++ (avem endfor in loc de acolade)
sum_for = 0;
for i=1:50
  sum_for += i;
endfor

% while similar cu C/C++ (avem endwhile in loc de acolade)
sum_while = 0;
i = 1;
while i <= 50
  sum_while += i;
  ++i;
endwhile

% extra: putem lua v un vector cu indici random (numere intregi)
% si putem itera prin el direct, fara indice.
v = [1 7 3 7 3 8 9 3 1 5];
sum_v = 0;
for i=v
  sum_v += i;
endfor
