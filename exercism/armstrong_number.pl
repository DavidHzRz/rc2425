armstrong_number(N):-
    number_to_chars(N, R), chars_to_numbers(R, R2),
    length(R2, Pow), maplist(pow(Pow), R2, R3), sum_list(R3,N). 

chars_to_numbers([], []).
chars_to_numbers([Cab|Resto], [R1|R2]):-
    number_to_chars(R1, [Cab]),
    chars_to_numbers(Resto, R2).
    
pow(P, N, R):- R is N ^ P.
