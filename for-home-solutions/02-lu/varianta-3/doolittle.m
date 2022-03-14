function [L, U] = doolittle(A)
  
  % dimensiunile matricei A
  % m -> numarul de linii
  % n -> numarul de coloane
  [m, n] = size(A);
  
  % daca A nu este matrice patratica, atunci nu are sens sa continuam
  % factorizarea
  if m != n
    L = NaN;
    U = NaN;
    return
  endif
  
  % initializam matricele. l_ii = 1 -> putem pune direct 1-uri
  % cu eye()
  L = eye(n);
  U = zeros(n, n);
  
  % iteram pe pivoti, ca la orice factorizare
  for p = 1:n

    % calculam linia p din U cu o singura relatie. #vectorizare
    U(p, p:n) = A(p, p:n) - L(p, 1:p-1) * U(1:p-1, p:n);

    % calculam coloana p din L cu o singura relatie. #vectorizare
    L(p+1:n, p) = (A(p+1:n, p) - L(p+1:n, 1:p-1) * U(1:p-1, p)) / U(p, p);
  endfor
  
endfunction
