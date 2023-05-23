function [lb, steps] = ex1(A, max_steps, tol = 1e-7)  
  % 1. (1p) Cum se numeste acest algoritm ?

  % 2. (1p) Ce face linia A = HH(A) ?

  % 3. (1p) Rulati algoritmul pe matricea 5x5 si notati in comentarii
  % numarul de pasi efectuati de acesta.

  % 4. (1p) Ce optimizare suplimentara putem aduce acestui
  % algoritm pentru convergenta mai rapida ? De ce ?

  % 5. (2p) Functioneaza acest algoritm pe orice fel de matrice in
  % forma de mai jos ? Daca da, argumentati. Daca nu,
  % ce modificari ar trebui aduse pentru acest lucru ?

  steps = 0;
  A = HH(A);
  prev_A = A;
  n = length(A);

  while 1
    steps++;
    [Q, R] = qr(A);
    A = R * Q;
    
    if (norm(A - diag(diag(A))) < tol || steps == max_steps)
      lb = diag(A);
      return;
    endif

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
