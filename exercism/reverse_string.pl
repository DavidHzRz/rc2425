string_reverse(S, Reversed):-
    string_chars(S, Chars),
    reverse(Chars, List),
    string_chars(Reversed, List).

% my_reverse([], []).
% my_reverse([Cab|Resto], R2):- my_reverse(Resto, R), append(R, [Cab], R2).
