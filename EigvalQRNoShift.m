function [ eigenvalues ] = EigvalQRNoShift( D, tol, imax )

    % Opis:
    % Funkcja oblicza wartosci wlasne macierzy symetrycznych metoda
    % QR bez przesuniec. QR wykonywana za pomoca funkcji qrmgs.
    
    % Algorytm:
    % Ide¹ pojedynczego kroku k jest przeksztalcenie A{k} do A{k+1}.
    % W danym kroku dokonujemy rozbicia A{k} na Q{k} i R{k} i wyliczamy
    % na ich podstawie A{k+1} w sposob: A{k+1} = R{k} * Q{k}.
    % Ten algorytm konczy swoja prace w momencie:
    % - osiagniecia maksymalnej liczby iteracji
    % - przekroczenia tolerancji wartosci macierzy D
    
    % Wejscie:
    % D - macierz, której wyliczamy wartosci wlasne
    % tol - tolerancja (gorna granica wartosci) elementow zerowanych
    % imax -  maksymalna liczba iteracji
    
    % Wyjscie:
    % eigenvalues - wektor wartosci wlasnych macierzy D
    
    % Kod:
    
    n = size(D,1);
    i = 1;
    Di = D;
    while i <= imax && max( max( Di-diag(diag(Di)) ) ) > tol
        [Qi, Ri] = qrmgs(Di);
        Di = Ri * Qi;
        i = i+1;
    end
    
    if i > imax + 1
        error('imax exceeded program terminated');
    end
    
    eigenvalues = diag(Di);

end

