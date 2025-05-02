hamming_distance(Str1, Str2, Dist):- 
    string_codes(Str1, L1), 
    string_codes(Str2, L2),
    diferencias(L1, L2, Dist).

diferencias([], [], 0).
diferencias([Cab1|Resto1], [Cab2|Resto2], Dist):- 
    diferentes(Cab1, Cab2, R1),
    diferencias(Resto1, Resto2, R2),
    Dist is R1 + R2.

diferentes(A, B, 1):- A \= B.
diferentes(A, A, 0).
