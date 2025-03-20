/*

my_reverse(?Lista, ?Resultado)
	es cierto si Resultado unifica con una lista que contiene
	los elementos de Lista en orden inverso.

Ejemplo:
	
my_reverse([1,2,3,4,5], R).
R = [5,4,3,2,1].

*/

my_reverse([], []).
my_reverse([Cab|Resto], R2):- my_reverse(Resto, R), append(R, [Cab], R2).
