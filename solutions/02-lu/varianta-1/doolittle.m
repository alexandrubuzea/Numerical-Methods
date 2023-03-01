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

    % calculam linia p din U scriind inmultirea de matrici
    % pentru A(p, j), j = p:n
    for j = p:n
      
      % calculam suma din formula cunoscuta
      sigma = 0;
      
      for k = 1:p-1
        sigma += L(p, k) * U(k, j);
      endfor
      
      U(p, j) = A(p, j) - sigma;
    endfor
    
    % calculam coloana p din L scriind inmultirea de matrici
    % pentru A(i, p), i = p+1:n
    for i = p+1:n
      
      % calculam suma din formula cunoscuta
      sigma = 0;
      
      for k = 1:p-1
        sigma += L(i, k) * U(k, p);
      endfor

      L(i, p) = (A(i, p) - sigma) / U(p, p);
    endfor
  endfor
  
endfunction
