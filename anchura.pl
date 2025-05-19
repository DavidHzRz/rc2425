arbol1( 
       a(1, a(2,nil,nil), a(3,nil,nil))
	  ).
	  
arbol2(
       a(1, a(2, a(4,nil,nil), a(5,nil,nil)), 
	        a(3, a(6, nil,nil), a(7, a(8,nil,nil), nil)))
      ).

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

/*
(EXAMEN)
bin2gen(ArbolBinario, ArbolGenerico)
	es cierto si ArbolGenerico unifica con un árbol
	genérico equivalente a ArbolBinario
*/

bin2gen(a(Et, nil, nil), a(Et, [])).
bin2gen(a(Et, nil, HD), a(Et, [RD])):- HD \= nil,
	bin2gen(HD, RD).
bin2gen(a(Et, HI, nil), a(Et, [RI])):- HI \= nil,
	bin2gen(HI, RI).
bin2gen(a(Et, HI, HD), a(Et, [RI, RD])):- 
	HI \= nil, 
	HD \= nil,
	bin2gen(HI, RI),
	bin2gen(HD, RD).
