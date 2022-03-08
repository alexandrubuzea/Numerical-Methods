function [x] = task3(x, min_value, max_value, div)
  % scrieti o functie care primeste un vector si pastreaza in x
  % doar elementele intre max_value si min_value (inclusiv limitele),
  % care sunt numere intregi divizibile cu div.
  % nu aveti voie sa folositi (aka declarati) alte tablouri in
  % afara de x, adica toate operatiile vor fi facute in-place
  
  x = x(x <= max_value && x >= min_value);
  x = x(abs(x - floor(x)) < 1e-7);
  x = x(mod(x, div) < 1e-7);
endfunction
