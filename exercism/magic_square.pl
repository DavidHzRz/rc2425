:- use_module(library(clpfd)).

magic_square(M):-
    length(M, N),
    maplist(length_list(N), M),
    suma_filas(M, SumasFilas),
    suma_columnas(M, SumasColumnas),
    suma_diagonal_principal(M, SumaDP),
    suma_diagonal_secundaria(M, SumaDS),
    append(SumasFilas, SumasColumnas, SumasParciales),
    append(SumasParciales, [SumaDP, SumaDS], TodasSumas),
    todos_iguales(TodasSumas).

length_list(N, L) :- length(L, N).

suma_filas([], []).
suma_filas([Fila|Resto], [Suma|Sumas]) :-
    sum_list(Fila, Suma),
    suma_filas(Resto, Sumas).

suma_columnas(M, Sumas) :-
    transpose(M, MT),
    suma_filas(MT, Sumas).

suma_diagonal_principal(M, Suma) :-
    suma_diagonal_principal_aux(M, 0, Suma).

suma_diagonal_principal_aux([], _, 0).
suma_diagonal_principal_aux([Fila|Resto], P, Suma) :-
    nth0(P, Fila, Elem),
    P1 is P + 1,
    suma_diagonal_principal_aux(Resto, P1, SumaResto),
    Suma is Elem + SumaResto.

suma_diagonal_secundaria(M, Suma) :-
    length(M, N),
    P is N - 1,
    suma_diagonal_secundaria_aux(M, P, Suma).

suma_diagonal_secundaria_aux([], _, 0).
suma_diagonal_secundaria_aux([Fila|Resto], P, Suma) :-
    nth0(P, Fila, Elem),
    P1 is P - 1,
    suma_diagonal_secundaria_aux(Resto, P1, SumaResto),
    Suma is Elem + SumaResto.

todos_iguales([]).
todos_iguales([X|Xs]) :- maplist(=(X), Xs).
