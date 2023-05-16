function [lambda, x, err, steps] = ex3(A, x0, tol, max_steps, mu)
  % BONUS (3p)
  
  % Implementati o optimizare a metodei puterii inverse, numita
  % iterarea catului lui Raygleigh. Mai exact, dupa fiecare pas din
  % metoda puterii inverse, valoarea "deplasarii" mu este modificata
  % la catul lui Raygleigh asociat aproximatiei curente de vector
  % propriu.
  
  % Parametrii:
  % A -> matricea asupra careia se aplica metoda iterativa
  % x0 -> aproximatia initiala de vector propriu
  % tol -> toleranta dorita pentru vectorul propriu
  % max_steps -> numarul maxim de pasi pentru metoda iterativa)
  % mu -> aproximatia initiala de valoare proprie

  % Punctaj: 1p -> metoda CORECTA
  %          1p -> functionare CORECTA
  %          1p -> comparatie cu metoda puterii inverse (ca numar de pasi)

  endfunction
