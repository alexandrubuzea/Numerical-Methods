function [x, err, steps] = newton_system_method(F_handles, x0, tol, max_steps)
  % Aplicam metoda lui Newton pentru sisteme de ecuatii
  % neliniare.

  % Hint 1: Implementam mai intai functia pentru jacobianul
  % pentru cele n functii intr-un punct.

  % putem lua ca pas de aproximare pentru jacobian h = 1e-5
  
  % tol este toleranta de dorit pentru solutia aproximata
  % max_steps este numarul maxim de pasi pe care il poate
  % executa algoritmul

  h = 1e-5;
  
  prev_x = x0;
  
  steps = 0;

  while 1
      dx = jacobian(F_handles, prev_x, h) \ eval_handles(F_handles, prev_x);
      x = prev_x - dx;
      
      err = norm(dx);
      steps++;
 
      if err < tol || steps == max_steps
        return;
      endif
      
      prev_x = x;
  endwhile
endfunction

function [y] = eval_handles(F, x)
  n = length(x);
  y = zeros(n, 1);

  for i = 1:n
    y(i) = F{i}(x);
  endfor

endfunction
