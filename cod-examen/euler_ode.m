function x = euler_ode(f, x0, t0, tf, n)
  % o functie care implementeaza metoda Euler de integrare
  % folosind n puncte intermediare
  % Parametrii: f = f(t, x(t)), functia cu care se realizeaza
  % integrarea numerica  - derivata ( aka x'(t) = f(t, x(t)) )
  % x0 si t0 - conditii initiale (x(t0) = x0) (ca la problema Cauchy)
  % [t0, tf] - intervalul pe care realizam integrarea numerica
  % n - numarul de puncte intermediare, n >= 1
  
  t = linspace(t0, tf, n + 1); % n puncte, n + 1 intervale
  
  x = zeros(size(t));
  h = t(2) - t(1);
  
  t(1) = t0;
  x(1) = x0;
  
  m = length(x);
  
  % integrarea numerica efectiva
  for i = 2:m
    k = h * f(t(i - 1), x(i - 1));
    x(i) = x(i - 1) + k;
  endfor
endfunction
