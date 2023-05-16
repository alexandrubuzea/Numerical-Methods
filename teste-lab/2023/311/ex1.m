function [l, T, total_steps] = ex1(A, tol, max_steps)
  
  % TODO: Raspundeti la urmatoarele intrebari (tot in comentarii)
  
  % 1. Cum se numeste acest algoritm ? (1p)
  % 2. Pe ce algoritm rau conditionat se bazeaza acest algoritm ? (1p)
  % 3. Ce conditii trebuie indeplinite de parametri pentru
  % ca algoritmul sa functioneze ? (1p)
  % 4. Rulati algoritmul pe matricea 5x5 generata si scrieti
  % numarul de pasi realizat aici: __ (1p)
  % 5. De ce liniile
  %
  %    for j = 1:i-1
  %      x -= (x' * T(:, j)) * T(:, j);        
  %    endfor
  %
  % sunt executate in while ? Ar functiona algoritmul daca le-am
  % scoate din while ? Justificati ! (2p)

  T = [];
  l = [];
  n = length(A);

  total_steps = 0;

  for i=1:n
    x = rand(n, 1);
    x /= norm(x);
    steps = 0;
    while 1
      steps++;
      prev_x = x;
      x = A * x;
      
      for j = 1:i-1
        x -= (x' * T(:, j)) * T(:, j);        
      endfor

      x /= norm(x);
      err = norm(x - prev_x);

      if (steps == max_steps || err < tol)
        T = [T, x];
        l = [l, x' * A * x];
        total_steps += steps;
        break;
      endif
    endwhile
  endfor

endfunction

