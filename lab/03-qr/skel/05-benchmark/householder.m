function [Q, R] = householder(A)
  
  % dimensiunile matricei A
  [m, n] = size(A);
  
  % initializam Q cu unitatea
  Q = eye(m);
  
  % iteram pe pivoti (elemente diagonale)
  for p = 1:min([m-1, n])
    
    % vectorul de reflectat
    z = A(p:m, p);
    
    % sigma_p de adaugat la pivot
    sigma = sign(A(p, p)) * norm(z);
    
    % vectorul intreg v, cu care construim reflectorul
    v = [zeros(p-1, 1); A(p, p) - sigma; z(2:end)];
    
    % reflectorul
    H = eye(m) - 2 * v * v' / (v' * v);
    
    % update
    A = H * A;
    Q = H * Q;
  endfor
  
  % valorile finale ale matricelor ortogonala si respectiv superior
  % triunghiulara
  Q = Q';
  R = A;
endfunction