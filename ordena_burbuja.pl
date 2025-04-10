/*
ordena_burbuja(+Lista, -ListaR).
	es cierto cuando ListaR unifica con una lista que
	que contiene los mismos elementos que Lista ordenados
	de mayor a menor
*/

ordena_burbuja(Lista, Lista):- ordenada(Lista).

ordena_burbuja(Lista, R):- 
	append(L1, [E1, E2|L2], Lista), E1 > E2,
    append(L1, [E2, E1|L2], Lista2), 
    ordena_burbuja(Lista2, R).

ordena_burbuja(Lista, R):- 
	append(_, [E1, E2|_], Lista), E1 =< E2, 
    ordena_burbuja(Lista, R).

/*
ordenada(Lista)
	es cierto si los elementos de Lista están ordenados de
	menor a mayor

Principio de Inducción
*/

ordenada([]).
ordenada([_]).
ordenada([Cab1, Cab2|Resto]):- Cab1 < Cab2, ordenada([Cab2|Resto]).
