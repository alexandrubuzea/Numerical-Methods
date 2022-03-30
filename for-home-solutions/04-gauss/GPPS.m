function [R, x] = G(A, b)
    % algoritmul de eliminare gaussiana cu pivotare partiala
    % cu pivot scalat

    n = length(b);
    A_ext = [A, b];
    
    % parcurgerea pe pivoti
    for i = 1:n
      
        % facem pivotarea
        % incepem cu maximele pe fiecare linie

        max_elems = max(abs(A_ext(i:n, i:n+1)), [], 2);
        
        % aici calculam factorii de scalare si luam maximul si
        % indexul lui, intr-o singura linie
        % -> vectorizare

        [max_scale index] = max(abs(A_ext(i:n,i)) ./ max_elems);
        
        index += (i - 1);

        % swap pe linii
        aux = A_ext(index, :);
        A_ext(index, :) = A_ext(i, :);
        A_ext(i, :) = aux;

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