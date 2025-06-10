:- use_module(library(clpfd)).

% Ejemplo
s1([
    [5, 3, _,  _, 7, _,  _, _, _],
    [6, _, _,  1, 9, 5,  _, _, _],
    [_, 9, 8,  _, _, _,  _, 6, _],
    
    [8, _, _,  _, 6, _,  _, _, 3],
    [4, _, _,  8, _, 3,  _, _, 1],
    [7, _, _,  _, 2, _,  _, _, 6],
    
    [_, 6, _,  _, _, _,  2, 8, _],
    [_, _, _,  4, 1, 9,  _, _, 5],
    [_, _, _,  _, 8, _,  _, 7, 9]
]).

/*

	sudoku(Matrix).
		es cierto si Matrix unifica con una matriz de 9x9 casillas,
		dividido en 9 bloques de 3x3 casillas con números del 1 al 9,
		con números distintos por filas, columnas y bloques 3x3.

*/

sudoku(Rows):-
		length(Rows, 9),
		maplist(same_length(Rows), Rows),		%Matriz 9x9
		append(Rows, Vs), Vs ins 1..9,			%Con números del 1 al 9
		maplist(all_distinct, Rows),			%Con números distintos por filas
		transpose(Rows, Columns),				%Traspuesta de la matriz
		maplist(all_distinct, Columns),			%Con números distintos por columnas
		Rows = [As,Bs,Cs,Ds,Es,Fs,Gs,Hs,Is],
		blocks(As,Bs,Cs),
		blocks(Ds,Es,Fs),
		blocks(Gs,Hs,Is).

blocks([], [], []).
blocks([As,Bs,Cs|Ns1], [Ds,Es,Fs|Ns2], [Gs,Hs,Is|Ns3]):-
        all_distinct([As,Bs,Cs,Ds,Es,Fs,Gs,Hs,Is]),
        blocks(Ns1, Ns2, Ns3).
