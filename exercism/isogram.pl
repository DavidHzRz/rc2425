:- use_module(library(clpfd)).

/*
isogram(String).
    es cierto si la cadena String contiene caracteres diferentes excepto
    los espacios en blanco y los guiones que si se podrán repetir.

    string_lower    %Convierte todos los caracteres de una cadena a minúsculas
    string_codess    %Convierte los caracteres de una cadena a una lista numerica

exclude(blanco, Lista, R).
    es cierto si R unifica con la lista de números que contiene Lista
    eliminando las ocurrencias de blanco: 32 (espacio en blanco) y 45 (guión)

*/

blanco(32).
blanco(45).

isogram("").
isogram(String):-
        string_lower(String, LowerS),
        string_codes(LowerS, Lista),
        exclude(blanco, Lista, R),
        all_distinct(R).
