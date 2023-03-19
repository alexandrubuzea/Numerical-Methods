function [Q, R] = givens(A)
  
  % dimensiunile matricei A
  [m n] = size(A);
  
  % initializam Q cu matricea identitate
  Q = eye(m);

  % iteram pe triunghiul inferior
  for j = 1 : n
    for i = j+1 : m
      
      % initializam rotorul Givens
      G = eye(m);

      % calculam elementele rotorului
      r = sqrt(A(i, j)^2 + A(j, j)^2);
      c = A(j, j) / r;
      s = -A(i, j) / r;

      % punem elementele pe G pentru a crea rotorul Givens.
      G(j, j) = c;
      G(j, i) = -s;
      G(i, j) = s;
      G(i, i) = c;

      % aplicam (rotim) rotorul Givens
      A = G * A;
      
      % actualizam ortogonala.
      Q = G * Q;
    endfor
  endfor
  
  % calculul lui R + valoarea finala a lui Q
  Q = Q';
  R = A;
endfunction