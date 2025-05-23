matrix1([
            [2, 7, 6],
  			[9, 5, 1],
  			[4, 3, 8]
        ]).

:- use_module(library(clpfd)).

magic_square(M):-
    suma_filas(M, R),
    suma_columnas(M, R).
    %suma_diagonales(M, RD),
    %RC = RD.

suma_filas([], []).
suma_filas([Cab|Resto], [R1|R2]):-
    sum_list(Cab, R1),
    suma_filas(Resto, R2).

suma_columnas(M, R):-
    transpose(M, M2),
    suma_filas(M2, R).
        
