% Reverso de una lista
% se usara una funcion recursiva, utilizando un acumulador
% Lista:  [a,b,c,d]    Acumulador:  []
% Lista:  [b,c,d]      Acumulador:  [a]
% Lista:  [c,d]        Acumulador:  [b,a]
% Lista:  [d]          Acumulador:  [c,b,a]
% Lista:  []           Acumulador:  [d,c,b,a]
reversaAcumulador([H|T],A,R):-  reversaAcumulador(T,[H|A],R).
reversaAcumulador([],A,A).

reversa(L,R):-  reversaAcumulador(L,[],R).

% Palindroma
% Para saber si una lista es palindroma, hay que usar el metodo de reverse y verificar si es la misma
palindroma(L) :- reversa(L,L).

% Duplicar Lista
duplicar1([],[]).
duplicar1(L,D) :- L=[H|T],atom_concat(H, H, K),D=[K|Y],duplicar1(T,Y).

duplicar(L,D) :- duplicar1(L,D).

% Insertar en posicion X

insertar(Val,Pos,L,R) :-
    same_length([Val|L],R),
    append(A,L0,L),
    length(A,Pos),
    append(A,[Val|L0],R).

% Dividir en 2

dividir(L, A, B) :-
    append(A, B, L),
    length(A, O),
    length(B, N),
    ((O-1)=:=N;(O+1)=:=N;O=:=N),
    !.