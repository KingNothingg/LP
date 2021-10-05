parent(alexei, tolia).
parent(alexei, volodia).
parent(tolia, tima).
parent(tolia, sveta).

tolia(tolia).
tolia(tolin).
tolia(toli).

alexei(alexei).
alexei(alexeia).

volodia(volodia).
volodia(volodin).
volodia(volodi).

tima(tima).
tima(timi).
tima(timin).

sveta(sveta).
sveta(sveti).
sveta(svetin).

brat(brat).

otec(otec).

sestra(sestra).

my_sin(sin).

doch(doch).

imenit_padej(X, Y) :-
    tolia(X), Y = tolia, !;
    sveta(X), Y = sveta, !;
    volodia(X), Y = volodia, !;
    tima(X), Y = tima, !;
    alexei(X), Y = alexei.

male(X) :-
    not(sveta(X)).

brother(X,Y) :-
    parent(Z,X),
    parent(Z,Y),
    male(X),
    X \= Y, !.

sister(X, Y) :-
    parent(Z, X),
    parent(Z, Y),
    not(male(X)),
    X \= Y, !.

father(X, Y) :-
    parent(X, Y),
    male(X), !.

son(X, Y) :-
    parent(Y, X),
    male(X), !.

daughter(X, Y) :-
    parent(Y, X),
    not(male(X)), !.    

chei(chia).
chei(chei).
kto(kto).

familiarity(X):-
    brat(X), !;
    sestra(X), !;
    otec(X), !;
    doch(X), !;
    my_sin(X).

familiarity_request(A, B, C) :-
    brat(C), brother(A, B), !;
    sestra(C), sister(A, B), !;
    otec(C), father(A, B), !;
    my_sin(C), son(A, B), !;
    doch(C), daughter(A, B).

question(X) :-
    chei(X), !;
    kto(X).

my_name(X) :-
    tolia(X), !;
    volodia(X), !;
    sveta(X), !;
    tima(X), !;
    alexei(X).
parse([A, B, C, D], R) :-
    my_name(A), familiarity(B), my_name(C), imenit_padej(C, E), familiarity_request(A, E, B), R = yes, !;
    my_name(A), familiarity(B), my_name(C), imenit_padej(C, E), not(familiarity_request(A, E, B)), R = no, !;
    question(A), my_name(B), familiarity(C), kto(A), imenit_padej(B, E), familiarity_request(X, E, C), R = X, !;
    question(A), familiarity(B), my_name(C), kto(A), imenit_padej(C, E), familiarity_request(X, E, B), R = X, !;
    question(A), familiarity(B), my_name(C), chei(A), imenit_padej(C, E), familiarity_request(E, X, B), R = X.
