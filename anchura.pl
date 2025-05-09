/*
(EXAMEN)
anchura(ArbolGenerico, ListaRecorrido)
	es cierto si ListaRecorrido unifica con las etiquetas de
	ArbolGenerico recorridas en anchura de izquierda a derecha.
*/

anchura(a(E, ListaHijos), [E|R]):-
	anchura(ListaHijos, R).

anchura([], []).
anchura([a(E, ListaHijos)|Resto], [E|R2]):-
	append(Resto, ListaHijos, R),
	anchura(R, R2).
