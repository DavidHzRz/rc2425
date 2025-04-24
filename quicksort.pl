%---------------------------------------------------
% ordena_quick(+Lista, -ListaR).
% es cierto cuando ListaR unifica con una lista que
% contiene los mismos elementos que Lista ordenados
% de menor a mayor.
%--------------------------------------------------

ordena_quick([],[]).
ordena_quick([Cab|Resto], R):-
	divide(Cab, Resto, Men, May),
	ordena_quick(Men, RMen),
	ordena_quick(May, RMay),
	append(RMen, [Cab|RMay], R).



%-----------------------------------------------------
% divide(+Elem, +Lista, -Menores, -Mayores)
% es cierto cuando Menores unifica con una lista que
% contiene los elemenentos de Lista que son menores
% o iguales que Elem y Mayores unifica con una lista
% que contiene los elementos de Lista que son
% mayores que Elem.
%------------------------------------------------------

divide(_, [], [], []).
divide(Elem, [Cab|Resto], [Cab|RMen], RMay):-
	Elem =< Cab,
	divide(Elem, Resto, RMen, RMay).
	
divide(Elem, [Cab|Resto], RMen, [Cab|RMay]):-
	Elem > Cab,
	divide(Elem, Resto, RMen, RMay).
