function [L] = cholesky(A)
  
  % dimensiunile matricei A
  % m -> numarul de linii
  % n -> numarul de coloane
  [m, n] = size(A);
  
  % daca A nu este matrice patratica, atunci nu are sens sa continuam
  % factorizarea
  if m != n
    L = NaN;
    return
  endif
  
  % verificam daca matricea A respecta conditiile (A simetrica si
  % pozitiv definita)

  % este A simetrica ?
  if norm(A - A') > 1e-10
    L = NaN;
    return
  endif
  
  % este A pozitiv definita ? - aici se putea face si
  % verificare de spectru aka toate valorile proprii > 0
  for p=1:n
    if det(A(1:p, 1:p)) < 0
      L = NaN;
      return
    endif
  endfor

  % initializam matricea L. Aici nu mai avem valori de 1, deci o vom
  % initializa mereu cu zerouri.
  L = zeros(n, n);
  
  % iteram pe pivoti, ca la orice factorizare
  for p = 1:n
    
    % calculam pivotul L(p, p) separat (cholesky)
    L(p, p) = sqrt(A(p, p) - L(p, 1:p-1) * L(p, 1:p-1)');
    
    % calculam coloana p din L scriind inmultirea de matrici
    % pentru A(i, p), i = p+1:n
    for i = p+1:n
      L(i, p) = (A(i, p) - L(i, 1:p-1) * L(p, 1:p-1)') / L(p, p);
    endfor
  endfor
  
endfunction
