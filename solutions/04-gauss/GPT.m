function [R, x] = GPT(A, b)
    % algoritmul de eliminare gaussiana cu pivotare totala
    n = length(b);
    A_ext = [A, b];

    % vectorul de permutari    
    v = 1:n;

    % parcurgerea pe pivoti
    for i = 1:n
        A_ext

        % luam maximele pe coloane
        [elems, indexes] = max(abs(A_ext(i:n, i:n)));
        
        [maxelem, col] = max(elems);
        line = indexes(col);
        
        line += (i - 1);
        col += (i - 1);

        % swap la linii
        aux = A_ext(i, :);
        A_ext(i, :) = A_ext(line, :);
        A_ext(line, :) = aux;
        
        % swap la coloane
        aux = A_ext(:, i);
        A_ext(:, i) = A_ext(:, col);
        A_ext(:, col) = aux;
        
        % swap in vectorul de permutari
        aux = v(col);
        v(col) = v(i);
        v(i) = aux;

        line
        col

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
    
    % realizam inapoi permutarile
    % ne construim o matrice de permutare

    P = zeros(n, n);
    for i = 1:n
      P(i, v(i)) = 1;
    endfor
    
    x = P * x;

endfunction