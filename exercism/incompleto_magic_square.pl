:- use_module(library(clpfd)).

magic_square(Square) :-
    % Verifica que Square sea una matriz cuadrada (N x N)
    length(Square, N),
    maplist(length_list(N), Square), % Todas las filas tienen longitud N

    % Calcula suma de la primera fila
    nth0(0, Square, FirstRow),
    sum_list(FirstRow, MagicSum),

    % Verifica sumas de filas
    maplist(sum_row_equals(MagicSum), Square),

    % Verifica sumas de columnas
    transpose(Square, Transposed),
    maplist(sum_row_equals(MagicSum), Transposed),

    % Verifica diagonales
    diagonal_principal(Square, Diag1),
    sum_list(Diag1, MagicSum),
    diagonal_secundaria(Square, Diag2),
    sum_list(Diag2, MagicSum).


% Verifica que una lista tenga longitud N
length_list(N, List) :- length(List, N).

% Verifica que la suma de una fila sea igual a MagicSum
sum_row_equals(MagicSum, Row) :- sum_list(Row, MagicSum).

% Obtiene la diagonal principal (de arriba-izquierda a abajo-derecha)
diagonal_principal([], []).
diagonal_principal([Row|Rows], [Element|Diagonal]) :-
    nth0(0, Row, Element),
    maplist(remove_first, Rows, RowsWithoutFirst),
    diagonal_principal(RowsWithoutFirst, Diagonal).

remove_first([_|Tail], Tail).

% Obtiene la diagonal secundaria (de arriba-derecha a abajo-izquierda)
diagonal_secundaria(Square, Diagonal) :-
    length(Square, N),
    diagonal_secundaria_aux(Square, 0, N, Diagonal).

diagonal_secundaria_aux([], _, _, []).
diagonal_secundaria_aux([Row|Rows], Index, N, [Element|Diagonal]) :-
    Pos is N - 1 - Index,
    nth0(Pos, Row, Element),
    NextIndex is Index + 1,
    diagonal_secundaria_aux(Rows, NextIndex, N, Diagonal).

lists_firsts_rests([], [], []).
lists_firsts_rests([[F|Os]|Rest], [F|Fs], [Os|Oss]) :-
    lists_firsts_rests(Rest, Fs, Oss).
