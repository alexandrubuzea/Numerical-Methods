function [y] = lagrange(xx, yy, x)
  n = length(x);
  y = zeros(1, n);
  
  for p=1:n
    curr_x = x(p);

    for i=1:length(xx)
      term = yy(i) * prod((curr_x - xx(1:i-1)) ./ (xx(i) - xx(1:i-1)));
      term *= prod((curr_x - xx(i+1:length(xx))) ./ (xx(i) - xx(i+1:length(xx))));
      
      y(p) += term;
    endfor
  endfor
endfunction
