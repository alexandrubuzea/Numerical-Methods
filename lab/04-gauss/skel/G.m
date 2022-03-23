function [R, x] = G(A, b)
    % algoritmul de eliminare gaussiana clasica
    n = length(b);
    A_ext = [A, b];
    
    % parcurgerea pe pivoti
    for i = 1:n
        for k = i+1:n
            % raportul de scalare
            ratio = A_ext(k, i) / A_ext(i, i);
            
            % scaderea liniei scalate -> obtinem 0-uri sub pivot
            A_ext(k, :) = A_ext(k, :) - ratio * A_ext(i, :);
        endfor
    endfor
    
    % luam R - matricea superior triunghiulara, b_new si rezolvam
    % sistemul superior triunghiular.
    R = A_ext(:, 1:n);
    b_new = A_ext(:, n+1);
    x = SST(R, b_new);
endfunction