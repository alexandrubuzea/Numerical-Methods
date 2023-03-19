function [Q, R] = gram_schmidt_elementwise(A)
  [m, n] = size(A);
  
  Q = [];
  R = zeros(m, n);
  
  for p=1:n
    a_p = A(:, p); % luam coloana a_p
    
    % pas 1: determinam toate r_ip cu i < p
    for i=1:p-1
      R(i, p) = Q(:, i)' * a_p;
    endfor

    % pas 2: trebuie sa ortogonalizam coloana in raport cu
    % toate coloanele existente deja in Q.
    % cum facem asta ? -> scadem proiectiile

    for i=1:p-1
      q_i = Q(:, i); % a i-a coloana din matricea Q
      a_p -= R(i, p) * q_i;
    endfor
    
    % pas 3: acum, avem relatia de la laborator de forma:
    % q_p * r_pp = a_p - (suma de proiectii)
    % trecem la norma pentru r_pp si apoi calculam q_p

    R(p, p) = norm(a_p); % am determinat elementul diagonal

    q_p = a_p / R(p, p); % normalizam coloana

    Q = [Q, q_p]; % punem coloana in Q

  endfor
endfunction
