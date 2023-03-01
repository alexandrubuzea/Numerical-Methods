function [mean_vect, std_vect] = distribution(x)
  mean_vect = mean(x);
  std_vect = sqrt(sum((x - mean_vect) .^ 2) / length(x));
endfunction
