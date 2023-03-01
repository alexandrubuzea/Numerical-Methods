function [S] = trapezoidal(f, a, b, n)
  % functie care calculeaza aria de sub un grafic (aka o integrala)
  % prin metoda trapezelor
  % Parametrii:
  % f -> handler la functie (un fel de pointer la functia
  % pentru care facem integrala). Obligatoriu cu implementare
  % vectorizata !
  % a, b -> capetele intervalului
  % n -> numarul intervalelor pe care aplicam regula
  % compusa a trapezelor

  h = (b - a) / n;
  S = h * ((f(a) + f(b)) / 2 + sum(f((a+h):h:(b-h))));
endfunction
