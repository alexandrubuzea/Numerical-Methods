function [J] = jacobian(F_handles, x0, h)
  % Calculam o aproximatie pentru matricea jacobiana
  % in punctul x0, avand la dispozitie un array (cells) de n
  % functii si punctul x0 in care se calculeaza aproximatia
  % pentru jacobian
  
  % Hint1: x0 este un punct in R^n, adica este un vector cu
  % n componente

  % Hint2: F_handles este un sir tot de dimensiune n, care
  % contine functii ce primesc un vector de dimensiune n
  % si returneaza un rezultat numeric. Cu alte cuvinte,
  % F = {f1, f2, .., fn}
  
  % Hint3: Puteti calcula/aproxima derivata lui f in x
  % cu formula f'(x) = f(x+h) - f(x-h) / (2*h)
  
  % Hint4: Adresarea lui fi (a i-a functie din array-ul de cells)
  % se face prin F_handles{i}, nu F_handles(i) cum suntem
  % obisnuiti
 
  n = length(F_handles);
  J = zeros(n, n);

  for i = 1:n
    for j = 1:n
      left = x0;
      left(j) = x0(j) - h;
      right = x0;
      right(j) = x0(j) + h;

      J(i, j) = (F_handles{i}(right) - F_handles{i}(left)) / (2 * h);      
    endfor
  endfor
endfunction
