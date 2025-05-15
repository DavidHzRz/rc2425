
grafo1(
	g([a, b, c, d], [a(a, b), a(a, c), a(c, d), a(c, b)])
).

grafo2(
	g([a, b, c, d, e], 
	[a(a, b), a(a, c), a(b, c), a(b, d), a(d, e), a(e, c), a(d, c), a(e, b)])
).
	
/*

Consideraciones:

1. Camino: No dirigido,
		   Camino = Lista de aristas, 
		   Visitados = Aristas, 
		   n0 = Todas las aristas visitadas

camino(g(Vertices, Aristas), Ini, Fin, Visitados, Camino)
	es cierto si camino unifica con una lista de aristas
	para Ini hasta Fin sin repetir las aristas visitadas en
	el grafo.
*/

camino(G, Ini, Fin, Visitados, [a(Ini, Fin)]):- 
	\+ member(a(Ini, Fin), Visitados), 
	conectado(G, Ini, Fin).
camino(g(Vertices, Aristas), Ini, Fin, Visitados, [a(Ini, TMP)|Camino]):-
	conectado(g(Vertices, Aristas), Ini, TMP),
	\+ member(a(Ini, TMP), Visitados),
	camino(g(Vertices, Aristas), TMP, Fin, [a(Ini, TMP), a(TMP, Ini)|Visitados], Camino).
	
	
%Dirigido
conectado(g(_, Aristas), Ini, Fin):- 
	member(a(Ini, Fin), Aristas).

%Para no dirigido añadir:
conectado(g(_, Aristas), Ini, Fin):- 
	member(a(Fin, Ini), Aristas).


