function [L D U] = task2(matrix)
  % sa se scrie o functie care returneaza partea inferior
  % triunghiulara (de sub diagonala principala), pe cea
  % diagonala si pe cea superior triunghiulara
  % se garanteaza ca matricea A data este patratica
  
  L = tril(matrix);
  U = triu(matrix);
  D = diag(diag(matrix));
  L -= D;
  U -= D;

endfunction
