function [L, U] = crout(A)
  
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
  
  % initializam matricele. u_ii = 1 -> putem pune direct 1-uri
  % cu eye()
  L = zeros(n, n);
  U = eye(n);
  
  % iteram pe pivoti, ca la orice factorizare
  for p = 1:n
    
    % calculam coloana p din L cu o singura relatie. #vectorizare
    L(p:n, p) = A(p:n, p) - L(p:n, 1:p-1) * U(1:p-1, p);
    
    % calculam linia p din U cu o singura relatie. #vectorizare
    U(p, p+1:n) = (A(p, p+1:n) - L(p, 1:p-1) * U(1:p-1, p+1:n)) / L(p, p);
  endfor
  
endfunction
