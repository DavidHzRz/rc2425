anagram(Word, Candidates, Anagrams):-
    string_lower(Word, LowerWord),
    string_codes(LowerWord, L1),
    msort(L1, Ls1),
    aux(Ls1, LowerWord, Candidates, Anagrams).

aux(_, _, [], []).
aux(Ls1, Word, [Cab|Resto], [Cab|R]):- 
    string_lower(Cab, LowerCab),
    string_codes(LowerCab, L2),
    msort(L2, Ls2),
    Ls1 = Ls2,
    aux(Ls1, Word, Resto, R).
aux(Ls1, Word, [_|Resto], R):- 
    aux(Ls1, Word, Resto, R).
