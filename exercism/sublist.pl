sublist(L, L, equal).
sublist(L1, L2, sublist):- append([_, L1, _], L2).
sublist(L1, L2, superlist):- append([_, L2, _], L1).
sublist(L1, L2, unequal):- 
    \+ sublist(L1, L2, sublist), 
    \+ sublist(L1, L2, superlist), 
    \+ sublist(L1, L2, equal).
