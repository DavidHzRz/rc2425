:- use_module(library(clpfd)).

matrix_1([
	[1, 1, 0, 1, 1, 0, 0, 0],
	[1, 0, 1, 1, 0, 0, 0, 0],
	[1, 1, 1, 0, 0, 1, 1, 1],
	[0, 0, 0, 0, 0, 1, 1, 0],
	[1, 0, 0, 0, 1, 1, 0, 0],
	[1, 1, 0, 0, 0, 1, 1, 1],
	[0, 0, 1, 0, 1, 0, 0, 1],
	[1, 0, 0, 0, 0, 0, 1, 1]

]).

matrix_2([
	[0, 1, 0],
	[1, 0, 0],
	[1, 1, 0]
]). 

tick(Current, Next) :-
    neighbors(X, Y, Matrix, List).

neighbors(X, Y, Matrix, List):-
    select(Matrix, Y, Rows),    % Selecciona las filas
    transpose(Rows, Cols),      % hace la traspuesta
    select(Cols, X, R),         % Selecciona las columnas
    transpose(R, R2),           % Ordena
    append(R2, List).
    
/*   
select(Matrix, Pos, R)
    Selecciona las filas (o columnas si traspuesta)
    L1 y L3 son las filas que desechamos, en R se quedan
    solo las filas de interés
*/
select(Matrix, Pos, R):-
    length(Matrix, LM), N1 is Pos - 1,
    N12 is max(0, N1),
    length(L1, N12),
    N3 is LM - (Pos + 2), N32 is max(0, N3),
    length(L3, N32),
    append([L1, R, L3], Matrix).
