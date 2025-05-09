arbol1(
		a(1, a(2,nil,nil), a(3,nil,nil))
	).
	
arbol2(
		a(1, a(2, a(4, nil, nil), a(5, nil, nil)), 
			 a(3, a(6, nil, nil), a(7, a(8, nil, nil), nil)))
	).

/*
inorden(ArbolBinario, ListaRecorrido)
	es cierto si ListaRecorrido unifica con las etiquetas de
	ArbolBinario recorridas en inorden.
*/

inorden(nil, []).
inorden(a(E, AI, AD), L):-
	inorden(AI, LI),
	inorden(AD, LD),
	append(LI, [E|LD], L).
	
/*
preorden(ArbolBinario, ListaRecorrido)
	es cierto si ListaRecorrido unifica con las etiquetas de
	ArbolBinario recorridas en preorden.
*/
preorden(nil, []).
preorden(a(E, AI, AD), L):-
	preorden(AI, LI),
	preorden(AD, LD),
	append([E|LI], LD, L).

/*
postorden(ArbolBinario, ListaRecorrido)
	es cierto si ListaRecorrido unifica con las etiquetas de
	ArbolBinario recorridas en postorden.
*/
postorden(nil, []).
postorden(a(E, AI, AD), L):-
	postorden(AI, LI),
	postorden(AD, LD),
	append([LI, LD, [E]], L).


/*
anchura(ArbolBinario, ListaRecorrido)
	es cierto si ListaRecorrido unifica con las etiquetas de
	ArbolBinario recorridas en anchura de izquierda a derecha.
*/
% Convertir a arbol generico y usar anchura.
