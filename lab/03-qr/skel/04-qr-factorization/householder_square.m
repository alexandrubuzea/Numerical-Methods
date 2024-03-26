function [Q, R] = householder_square(A)
  
  % dimensiunile matricei A
  n = length(A);
  
  % initializam Q cu unitatea
  Q = eye(n);
  
  % iteram pe pivoti (elemente diagonale)
  for p = 1:n-1
    
    % vectorul de reflectat
    z = A(p:n, p);
    
    % sigma_p de adaugat la pivot
    sigma = sign(A(p, p)) * norm(z);
    
    % vectorul intreg v, cu care construim reflectorul
    % puteam folosi si + sigma (ca in laborator), ambele alegeri dau
    % factorizari valide, dar trebuie sa fim consistenti in alegere.

    v = [zeros(p-1, 1); A(p, p) - sigma; z(2:end)];
    
    % reflectorul
    H = eye(n) - 2 * v * v' / (v' * v);
    
    % update
    A = H * A;
    Q = H * Q;
  endfor
  
  % valorile finale ale matricelor ortogonala si respectiv superior
  % triunghiulara
  Q = Q';
  R = A;
endfunction