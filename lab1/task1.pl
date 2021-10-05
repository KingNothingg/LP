my_len([], 0).
my_len([_|T], N) :- my_len(T, N1), N is N1 + 1.

my_member(A,[A|_]).
my_member(A,[_|T]) :- my_member(A,T).

my_append([], X, X).
my_append([A|X], Y, [A|Z]) :- my_append(X,Y,Z).

my_remove(X, [X|T], T).
my_remove(X,[Y|T], [Y|T1]) :- my_remove(X,T,T1).

my_permute([],[]).
my_permute(L,[X|T]) :- my_remove(X,L,R), my_permute(R,T).

my_sublist(S, L) :-my_append(_, L1, L), my_append(S,_,L1).

remove_last_std(L,R) :- append(R, [X], L).

my_remove_last([X], []).
my_remove_last([L|T], [L|R]) :- my_remove_last(T,R). 

is_ascending([T,H|R]):- 
    !, 
    T < H,
    is_ascending([H|R]). 
is_ascending(_).

is_ascending_std([T|H]) :-
    length(H,L),
    L =\= 0,
    member(Y,H),
    !,
    T < Y,
    is_ascending_std(H).
is_ascending_std(_).

%проверка, будет ли список без последнего элемента возрастающим.
is_ascending_without_last(L) :-
    my_remove_last(L, R),
    is_ascending(R). 
