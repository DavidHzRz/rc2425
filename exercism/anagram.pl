anagram(Word, Candidates, Anagrams):-
    string_codes(Word, L1),
    aux(L1, Candidates, Anagrams).

aux(_, [], []).
aux(L1, [Cab|Resto], [Cab, R]):-
    string_codes(Cab, L2),
    esAnagrama(L1, L2),
    aux(L1, Resto, R).

esAnagrama(L1, L2):-
    sort(L1, Ls1),
    sort(L2, Ls2),
    listasIguales(Ls1, Ls2).

listasIguales([], []).
listasIguales([Cab1|Resto1], [Cab2|Resto2]):-    
    Cab1 = Cab2,
    listasIguales(Resto1, Resto2).
