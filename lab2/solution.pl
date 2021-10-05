event(concert, [levitskiy, voronov, singer]).
event(art, [pavlov, writer, artist]).
event(biography, [writer, saharov, voronov]).

unfamiliar([levitskiy, voronov]).
familiar([pavlov, writer]).
familiar([pavlov, artist]).
familiar([writer, artist]).

familiarity_contradiction(P1, J1, P2, J2) :-
    unfamiliar(X),
    member(P1,X), member(P2, X),
    familiar(Y),
    member(J1, Y), member(J2, Y),
    !.

event_contradiction(Person, Job) :-
    event(_, X),
    member(Person, X), member(Job, X), 
    !.

list_contradiction([], []).

list_contradiction([P,P1|P2], [J,J1|J2]) :-
    not(event_contradiction(P, J)),
    not(event_contradiction(P1, J1)),
    not(familiarity_contradiction(P, J, P1, J1)),
    !,
    list_contradiction(P2, J2).

solve(Lev, Vor, Pav, Sah) :-
    permutation([dancer, singer, writer, artist], [Lev, Vor, Pav, Sah]),   
    list_contradiction([levitskiy, voronov, pavlov, saharov], [Lev, Vor, Pav, Sah]).
