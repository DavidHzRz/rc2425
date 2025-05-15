
grafo1(
	g([a, b, c, d], [a(a, b), a(a, c), a(c, d), a(c, b)])
).

/*
Grafos

g(ListaVertices, ListaAristas)
g([a, b, c, d], [a(a, b), a(a, c), a(c, d), a(c, b)].


Caminos en grafos:

	Ini --Arista-- TMP ----------- Camino --------- Fin

Formas de representar el camino
 1. Lista de vertices
 2. Lista de aristas
	
Casos más sencillos
 1. Ini = Fin
 2. Existe una arista entre Ini y Fin

Lista de visitados
 1. Lista de aristas
 2. Lista de vertices
 
Tipo de grafo
 1. Dirigido
 2. No dirigido
 
Inducción	
1) P(n0)
	1.a) camino(Grafo, Ini, Ini, ).
	1.b) camino(Grafo, Ini, Fin, ):- arista(Ini, Fin, Grafo).
2) 

*/
	
/*

Consideraciones:

1. Camino: No dirigido,
		   Camino = Lista de vertices, 
		   Visitados = Vertices, 
		   n0 = Ini=Fin

camino(g(Vertices, Aristas), Ini, Fin, Visitados, Camino)
	es cierto si camino unifica con una lista de vertices
	para llegar desde Ini hasta Fin sin repetir los vertices
	visitados.
*/

camino(_, Ini, Ini, _, [Ini]).
camino(g(Vertices, Aristas), Ini, Fin, Visitados, [Ini|Camino]):-
	conectado(g(Vertices, Aristas), Ini, TMP),
	\+ member(TMP, Visitados),
	camino(g(Vertices, Aristas), TMP, Fin, [TMP|Visitados], Camino).
	
	
%Dirigido
conectado(g(_, Aristas), Ini, Fin):- 
	member(a(Ini, Fin), Aristas).

%Para no dirigido añadir:
conectado(g(_, Aristas), Ini, Fin):- 
	member(a(Fin, Ini), Aristas).


