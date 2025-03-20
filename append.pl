/*

my_append(?List1, ?List2, ?Result).
	es cierto si Result unifia con una lista que contiene los
	elementos de List1 seguidos de los elementos de List2 en el
	mismo orden.
	
*/

my_append([], List2, List2).
my_append([Cab|Resto], List2, [Cab|R]):- my_append(Resto, List2, R).
