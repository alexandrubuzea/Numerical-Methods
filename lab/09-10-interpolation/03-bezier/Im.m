function [im] = Im(z)
  im = (z - conj(z)) / (2 * j);
endfunction
