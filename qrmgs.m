function [ Q, R ] = qrmgs(A)

    % Opis:
    % QR modified Gram-Schmidt jest implementacja rozkladu QR (waskiego)
    % macierzy zmodyfikowanym algorytmem Grama-Schmidta.
    % Program przeznaczony dla macierzy prostokatnych o pelnym rzedzie,
    % o elementach zarowno rzeczywistych, jak i zespolonych.
    % Algorytm pochodzi z ksiazki Piotra Tatjewskiego "Metody Numeryczne"
    
    % Warunki:
    % Jesli macierz A o wymiarach m x n, to
    % m >= n
    
    % Wejscie:
    % A - macierz poddawana rozkladowi
    
    % Wyjscie:
    % Q - macierz
    % R - macierz
    
    %Kod:
    
    [m  n] = size(A);
    Q = zeros(m,n);
    R = zeros(m,n);
    d = zeros(1,n);
    
    % rozklad z kolumnami Q ortogonalnymi (nie ortonormalnymi)
    for i=1:n
        Q(:,i) = A(:,i);
        R(i,i) = 1;
        d(i) = Q(:,i)' * Q(:,i);
        
        for j=i+1:n
            R(i,j) = ( Q(:,i)' * A(:,j) ) / d(i);
            A(:,j) = A(:,j) - R(i,j) * Q(:,i);
        end
    end
    
    % normowanie rozkladu (kolumny Q ortonormalne)
    for i=1:n
        dd=norm( Q(:,i) );
        Q(:,i) = Q(:,i) / dd;
        R(i,i:n) = R(i,i:n) * dd;
    end

end

