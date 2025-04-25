%! create(+DimTuple)
%
% The create/1 predicate succeeds if the DimTuple contains valid chessboard 
% dimensions, e.g. (0,0) or (2,4).

create((DimX, DimY)):- DimX > 0, DimY > 0, DimX = DimY.

% create((DimX, DimX)):- DimX > 0.

%! attack(+FromTuple, +ToTuple)
%
% The attack/2 predicate succeeds if a queen positioned on ToTuple is 
% vulnerable to an attack by another queen positioned on FromTuple.

attack((FromX, FromY), (ToX, ToY)):- FromX = ToX.
attack((FromX, FromY), (ToX, ToY)):- FromY = ToY.
attack((FromX, FromY), (ToX, ToY)):- DifX is abs(FromX - ToX), DifY is abs(FromY - ToY), DifX = DifY.

% same_row((_,Y), (_,Y)).
% same_column((X,_), (X,_)).
% same_diagonal((X,Y), (X2, Y2)):- abs(X - X2) =:= abs(Y - Y2).

% attack((P1, P2)):- same_row(P1, P2).
% attack((P1, P2)):- same_column(P1, P2).
% attack((P1, P2)):- same_diagonal(P1, P2).
