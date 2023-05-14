function [lb, steps] = ex1(A, max_steps, tol = 1e-7)  
  % 1. (1p) Cum se numeste acest algoritm ?

  % 2. (1p) Ce face linia A = HH(A) ?
  % Hint: printati A inainte si dupa aplicarea functiei HH()

  % 3. (0.5p) Rulati algoritmul si notati in comentarii 
  % numarul de pasi efectuati de acesta.

  % 4. (2p) Modificati algoritmul astfel incat sa obtinem
  % varianta acestuia *cu deplasare* data de coltul dreapta
  % jos al matricei A.

  % 5. (0.5p) Rulati noul algoritm si comparati numarul nou de
  % pasi efectuati cu cel vechi. Avem improvement ?

  steps = 0;
  A = HH(A);
  prev_A = A;
  n = length(A);

  while 1
    steps++;
    [Q, R] = qr(prev_A);
    A = R * Q;
    
    if (norm(A - prev_A) < tol || steps == max_steps)
      lb = diag(A);
      return;
    endif
    
    prev_A = A;
  endwhile
endfunction

function [mat] = HH(A)
  n = length(A);

  for i = 1:n-2
    z = A(i+1:n, i);
    v = [zeros(i, 1); z];
    v(i + 1) -= sign(A(i + 1, i)) * norm(z);
    H = eye(n) - 2 * v * v' / (v' * v);
    
    A = H * A * H;
  endfor
  
  mat = A;
endfunction
