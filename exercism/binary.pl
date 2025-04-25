%binary(Str, Dec) :- 
%    string_chars(Str, List),
%    number_chars(List, Num),
%    max_list(Num, 1), 
%    min_list(Num, 0),
%    conversion(Num, Dec).

%conversion([], 0).
%conversion([Cab|Resto], R):- 
%    conversion(Resto, Dec), 
%    length(Resto, Longitud),
%    R is Dec + Cab * 2 ^ Longitud.


binary(Str, Dec):- string_chars(Str, List), maplist(binary, List), chars2dec(List, Dec).

chars2dec([], 0).

chars2dec([Head|Tail], R):-
    chars2dec(Tail, Dec),
    number_chars(N, [Head]), length(Tail, L), 
    R is Dec + N * 2 ^ L.

binary('0').
binary('1').
