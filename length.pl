/*
my_Length(List, Num)
	es cierto si Num unifica con el número de elementos de List.

Inducción
1) P(n0) es cierta.
2) P(n-1) -> P(n).	

*/

my_Length([], 0).
my_Length([_|Resto], R2):- my_Length(Resto, R), R2 is R + 1.
