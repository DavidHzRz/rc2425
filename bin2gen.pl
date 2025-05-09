arbol1(
		a(1, a(2,nil,nil), a(3,nil,nil))
	).
	
arbol2(
		a(1, a(2, a(4, nil, nil), a(5, nil, nil)), 
			 a(3, a(6, nil, nil), a(7, a(8, nil, nil), nil)))
	).

/*
(EXAMEN)
bin2gen(ArbolBinario, ArbolGenerico)
	es cierto si ArbolGenerico unifica con un árbol
	genérico equivalente a ArbolBinario
*/

bin2gen(a(E, nil, nil), b(E, [])).
bin2gen(a(E, nil, AD), b(E, LHD)):-
	bin2gen(AD, LHD).
bin2gen(a(E, AI, nil), b(E, LHI)):-
	bin2gen(AI, LHI).
bin2gen(a(E, AI, AD), b(E, [LHI, LHD])):-
	bin2gen(AI, LHI),
	bin2gen(AD, LHD).
	
