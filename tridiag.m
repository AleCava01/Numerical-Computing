%% TRIDIAG - Genera una matrice tridiagonale
%
%   [T] = TRIDIAG(VECT, N) crea una matrice tridiagonale di dimensione
%   NxN con i seguenti elementi:
%   - VECT(1) sulla sotto-diagonale (sotto la diagonale principale)
%   - VECT(2) sulla diagonale principale
%   - VECT(3) sulla sopra-diagonale (sopra la diagonale principale)
%
%   Input:
%       VECT - Vettore di tre elementi contenente i valori per la sotto-diagonale,
%              la diagonale principale e la sopra-diagonale, rispettivamente.
%       N    - Dimensione della matrice quadrata risultante (NxN).
%
%   Output:
%       T    - Matrice tridiagonale di dimensione NxN.
%
%   Esempio di utilizzo:
%       A = tridiag([1,2,3], 4);
%       % Output:
%       %     2     3     0     0
%       %     1     2     3     0
%       %     0     1     2     3
%       %     0     0     1     2
%
%   Autore: Alessandro Cavalieri
%   Data: 06-02-2024

function [T] = tridiag(vect, n)
    % Controllo degli input
    if length(vect) ~= 3
        error('Il vettore di input deve contenere esattamente tre elementi.');
    end
    if n < 2
        error('La dimensione della matrice deve essere almeno 2x2.');
    end
    
    % Creazione della matrice tridiagonale
    T = diag(ones(n-1,1)*vect(1), -1) + ...  % Sotto-diagonale
        diag(ones(n,1)*vect(2), 0) + ...     % Diagonale principale
        diag(ones(n-1,1)*vect(3), 1);        % Sopra-diagonale

    return
end
