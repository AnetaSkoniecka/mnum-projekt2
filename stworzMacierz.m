function [ M ] = stworzMacierz( N, czySym )

    % Opis:
    % Funkcja przygotowywuje losowa macierz

    % Wejscie:
    % N - generowana macierz jest rzêdu N {Integer}
    % czySym - decyzja czy macierz ma byc symetryczna {1/0}

    % Wyjscie:
    % M - wygenerowana macierz

    % Kod:

    M = rand(N);
    if czySym == 1
       M = M * M';
    end

end

