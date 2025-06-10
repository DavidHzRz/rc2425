can_chain([]).
can_chain([(A,A)]).
can_chain(List):-  
    length(List, L), L > 1, 
    path(List, A, A, R), 
    append(_, [(_,A)], R).

path([], _, _, []). 
path(List, A, B, [(A,TMP)|R]):-
    connect(A, TMP, List, Rest), 
    path(Rest, TMP, B, R).

% Devuelve una lista R con el elemento (A,B) o (B,A) quitado de List
connect(A,B, List, R):- 
    member((A,B), List), 
    append(L1, [(A,B)|L2], List),
    append(L1, L2, R).
connect(A,B, List, R):- 
    member((B,A), List), 
    append(L1, [(B,A)|L2], List),
    append(L1, L2, R).
