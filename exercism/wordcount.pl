word_count(String, R3):- 
    string_lower(String, R),
    split_string(R, " .\t:!?\n,", " !@$%^&\''", R2), 
    count(R2, R3).
    
count([], []).
count([E], [E-1]).
count([H|T], R2):- 
    count(T, R), 
    append(L1, [H-N|L2], R), N2 is N + 1, 
    append(L1, [H-N2|L2], R2).
    
count([H|T], [H-1|R]):- 
    count(T, R), 
    \+ append(_, [H-_|_], R), 
    \+ null_string(H).
    
count([H|T], R):- 
    count(T, R), 
    \+ append(_, [H-_|_], R), 
    null_string(H).

null_string("").
