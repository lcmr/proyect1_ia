% hechos
% hijo(persona1, persona2)
% padre/madre(persona1, persona2)
% pareja(persona1, persona2)
% hermano/hermana(persona1, persona2)
% imprimir_arbol(persona1).

% Bruce y Marta
pareja(marta,bruce).
% Diana y Peter
pareja(diana,peter).
% Rachel y Enrique
pareja(rachel,enrique).
% Pepper y Barry
pareja(pepper,barry).
% May y Ben
pareja(may,ben).

% Bruce padre de diana, rachel, pepper y may
padre(bruce,diana).
padre(bruce,rachel).
padre(bruce,pepper).
padre(bruce,may).
% Peter padre de Mary y Harry
padre(peter,mary).
padre(peter,harry).
% Ben padre de Ezio, Lorenzo y Sergio
padre(ben,ezio).
padre(ben,lorenzo).
padre(ben,sergio).
% Enrique padre de Clark y Lois
padre(enrique,clark).
padre(enrique,lois).
% Barry padre de Lara y Tony
padre(barry,lara).
padre(barry,tony).

% Marta madre de diana, rachel, pepper y may
madre(marta,diana).
madre(marta,rachel).
madre(marta,pepper).
madre(marta,may).
% Diana madre de Mary y Harry
madre(diana,mary).
madre(diana,harry).
% May madre de Ezio, Lorenzo y Sergio
madre(may,ezio).
madre(may,lorenzo).
madre(may,sergio).
% Rachel madre de Clark y Lois
madre(rachel,clark).
madre(rachel,lois).
% Pepper madre de Lara y Tony
madre(pepper,lara).
madre(pepper,tony).
% Hijos de Marta
hijo(diana,marta).
hijo(pepper,marta).
hijo(may,marta).
hijo(rachel,marta).
% Hijos de Diana
hijo(mary,diana).
hijo(harry,diana).
% Hijos de May
hijo(ezio,may).
hijo(lorenzo,may).
hijo(sergio,may).
% Hijos de Rachel
hijo(clark,rachel).
hijo(lois,rachel).
% Hijos de Pepper
hijo(lara,pepper).
hijo(tony,pepper).

hijo(X,Y) :- padre(Y,X).
hijo(X,Y) :- madre(Y,X).

hermano(may,diana).
hermano(may,rachel).
hermano(may,pepper).

hermano(mary,harry).

hermano(ezio,lorenzo).
hermano(ezio,sergio).

hermano(clark,lois).

hermano(lara,tony).

hermano(X,Y) :- hermano(Y,X).

tio(mary,may).
tio(harry,may).
tio(mary,rachel).
tio(harry,rachel).
tio(mary,pepper).
tio(harry,pepper).

tio(ezio,diana).
tio(lorenzo,diana).
tio(sergio,diana).
tio(ezio,rachel).
tio(lorenzo,rachel).
tio(sergio,rachel).
tio(ezio,pepper).
tio(lorenzo,pepper).
tio(sergio,pepper).

tio(clark,may).
tio(lois,may).
tio(clark,diana).
tio(lois,diana).
tio(clark,pepper).
tio(lois,pepper).

tio(lara,may).
tio(tony,may).
tio(lara,diana).
tio(tony,diana).
tio(lara,rachel).
tio(tony,rachel).
%---------------------------------
primo(ezio,mary).
primo(lorenzo,mary).
primo(sergio,mary).
primo(clark,mary).
primo(lois,mary).
primo(lara,mary).
primo(tony,mary).

primo(ezio,harry).
primo(lorenzo,harry).
primo(sergio,harry).
primo(clark,harry).
primo(lois,harry).
primo(lara,harry).
primo(tony,harry).

primo(mary,ezio).
primo(harry,ezio).
primo(clark,ezio).
primo(lois,ezio).
primo(lara,ezio).
primo(tony,ezio).

primo(mary,lorenzo).
primo(harry,lorenzo).
primo(clark,lorenzo).
primo(lois,lorenzo).
primo(lara,lorenzo).
primo(tony,lorenzo).

primo(mary,sergio).
primo(harry,sergio).
primo(clark,sergio).
primo(lois,sergio).
primo(lara,sergio).
primo(tony,sergio).

primo(ezio,lois).
primo(lorenzo,lois).
primo(sergio,lois).
primo(harry,lois).
primo(mary,lois).
primo(lara,lois).
primo(tony,lois).

primo(ezio,clark).
primo(lorenzo,clark).
primo(sergio,clark).
primo(mary,clark).
primo(harry,clark).
primo(lara,clark).
primo(tony,clark).

primo(ezio,lara).
primo(lorenzo,lara).
primo(sergio,lara).
primo(harry,lara).
primo(mary,lara).
primo(clark,lara).
primo(lois,lara).

primo(ezio,clara).
primo(lorenzo,clara).
primo(sergio,clara).
primo(mary,clara).
primo(harry,clara).
primo(clark,clara).
primo(lois,clara).

% reglas

hijos(X,Y) :- 
    findall(Hijo, hijo(Hijo,X),Y).

tiene_pareja(X,Y) :- pareja(Y,X) ; pareja(X,Y).

es_abuelo(X,Y) :- madre(Z,X),padre(Y,Z).

asesino(X) :- es_abuelo(X,bruce),tio(X,pepper),primo(X,clark),X==mary.

imprimir_arbol(X) :- 
                    tiene_pareja(X,Y),
                    atom(Y) ->
                        write(X),write(' - '),write(Y), 
                        nl,
                        hijos(X,Z),
                        list_to_set(Z,H),
                        imprimir_hijos(H),
                        nl
                    ; 
                        tab(4),write(X).


imprimir_hijos([]).
imprimir_hijos([H|T]) :- tab(4),imprimir_arbol(H),imprimir_hijos(T).