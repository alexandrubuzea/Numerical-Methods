function [x, err, steps] = Jacobi_non_matrix_form(A, b, x0, tol, max_steps)
  
  % initializari
  prev_x = x0;
  steps = 0;
  
  % n - dimensiunea sistemului
  n = length(A);

  % prealocare pentru x - pentru a-l folosi direct la prima iteratie (este
  % mai eficienta prealocarea de la inceput)
  x = zeros(n, 1);

  while 1
    steps++;

    % calculul nematriceal al lui x
    for i = 1:n
      x(i) = (b(i) - A(i, 1:i-1) * prev_x(1:i-1) - A(i, i+1:n) * prev_x(i+1:n)) / A(i, i);
    endfor
    
    % eroarea, exprimata relativ la solutia de la pasul precedent.
    err = norm(x - prev_x);

    if err < tol || steps == max_steps
      return;
    endif
    
    % inchidem ciclul -> continuam procesul iterativ
    prev_x = x;
  endwhile
endfunction
