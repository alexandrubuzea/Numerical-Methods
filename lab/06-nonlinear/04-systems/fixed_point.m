function [x, err, steps] = fixed_point(G_handles, x0, tol, max_steps)
  % Implementam o metoda de rezolvare a sistemelor de ecuatii
  % bazata pe puncte fixe (p = G(p))

  % se presupune ca conditiile necesare pentru derivatele partiale
  % sunt satisfacute.

  % tol este toleranta de dorit pentru solutia aproximata
  % max_steps este numarul maxim de pasi pe care il poate
  % executa algoritmul

  % Optional: puteti folosi optimizarea analoaga cu Gauss-Seidel
  % (sa folositi valorile lui x precedente de la pasul curent, nu
  % de la cel anterior).
  
  prev_x = x0;
  steps = 1;
  n = length(prev_x);
  
  while 1
    x = zeros(n, 1);
    for i = 1:n
      x(i) = G_handles{i}(prev_x);
    endfor
    
    err = norm(x - prev_x);
    
    if err < tol || steps == max_steps
      return;
    endif

    prev_x = x;
    steps++;
  endwhile

endfunction
