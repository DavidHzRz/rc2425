arbol1(
		a(1, a(2,nil,nil), a(3,nil,nil))
	).
	
arbol2(
		a(1, a(2, a(4, nil, nil), a(5, nil, nil)), 
			 a(3, a(6, nil, nil), a(7, a(8, nil, nil), nil)))
	).

/*
Implementar el predicado suma_nodos/2 que sume el contenido de todos los nodos de
un árbol.

suma_nodos(ArbolBinario, R)
	es cierto si R unifica con todas las etiquetas de ArbolBinario.
*/

suma_nodos(nil, 0).
suma_nodos(a(E, AI, AD), R):-
	suma_nodos(AI, RI),
	suma_nodos(AD, RD),
	R is E + RI + RD.


/*
Escribir el predicado miembro/2 que indique si un elemento X, pertenece a un árbol.


miembro(Elem, ArboBinario)
	es cierto si Elem es una etiqueta de ArbolBinario.
*/

miembro(Elem, a(Elem, _, _)).
miembro(Elem, a(_, AI, _)):-
	miembro(Elem, AI).
miembro(Elem, a(_, _, AD)):-
	miembro(Elem, AD).
