function [Q, R] = gram_schmidt(A)
  % dimensiunile lui A
  [m n] = size(A);
    
  % initializam Q cu o matrice goala
  Q = [];

  % iteram pe pivoti
  for p = 1 : n
      
    % coloana de studiat
    col = A(1 : m, p);

    % ortogonalizam in raport cu toate coloanele ortogonale
    % deja gasite
    for j = 1 : p-1
      q = Q(:, j);
      col -= (col' * q) / (q' * q) * q;
    endfor
    
    % partea de normalizare (coloana de norma 1)
    col /= norm(col);

    % putem adauga coloana in matricea Q
    Q = [Q col];
    endfor
    
    % matricea superior triunghiulara R
    R = Q' * A;
endfunction