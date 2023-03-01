function S = simpson(f, a, b, n)
  % functie care aplica metoda Simpson (interpolare cu segmente de parabola) 
  % pentru calculul ariei
  % Parametrii:
  % f = handler la functie (un fel de pointer la functie)
  % a, b -> capetele intervalului pe care calculam aria
  % Obligatoriu f trebuie sa fie vectorizata !!
  % n -> numarul de intervale pe care impartim
  % intervalul [a, b], NU numarul de puncte
  
  % pentru fiecare interval avem si punct median -> / 2
  h = (b - a) / (2 * n);
  S = h * (f(a) + 4 * sum(f(a+h:2*h:b-h)) + 2 * sum(f(a+2*h:2*h:b-2*h)) + f(b)) / 3;
  
endfunction
