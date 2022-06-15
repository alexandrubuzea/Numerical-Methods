function S = romberg_simpson(f, a, b, n)
  % construim prima coloana din triunghiul Romberg
  S = zeros(n + 1, 1);
  
  % plecam de la cazul de baza
  for i=1:n+1
    S(i) = simpson(f, a, b, 2 ^ (i - 1));
  endfor
  
  % recurenta - puteam si fara len, dar e mai usor de inteles asa
  % len se poate deduce din n si j
  
  % ATENTIE !!!
  % n + 1 pasi de simpson inseamna practic n + 2 pasi de trapeze
  % de aceea noi "avem" deja un pas de richardson facut, adica
  % formula va fi aplicata pentru j -> j + 1 (formula cu 4^j, nu
  % cu 4 ^ (j - 1))

  for j = 2:n+1
    len = length(S);
    prev_S = S;
    S = (4 ^ j * prev_S(2:len) - prev_S(1:len-1)) / (4 ^ j - 1);
  endfor
endfunction
