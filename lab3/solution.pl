count_k(L, N):-
	delete(L, 'm', L1),
	length(L1, M), N is M.

count_m(L, N):-
	delete(L, 'k', L1),
	length(L1, M), N is M.

balance(L):-
	count_m(L, X),
	count_k(L, Y),
	(X >= Y; X == 0).

sort_items(A, B):-
	append(Begin, ['m', 'k' | Tail], A), !,
	append(Begin, ['k', 'm' | Tail], C),
	sort_items(C, B);
	append(A, [], B).
%K->
move([LCoast, RCoast], [NewLCoast, NewRCoast]) :-
    member(b, LCoast),
    delete(LCoast, b, TempLCoast),
    append(Head, [k |Tail],TempLCoast),
    append(Head, Tail, SecTempLCoast),
    append(RCoast, [k, b], TempRCoast),
    sort_items(SecTempLCoast, NewLCoast),
    sort_items(TempRCoast, NewRCoast),
    balance(NewLCoast),
    balance(NewRCoast).
%KK->
move([LCoast, RCoast], [NewLCoast, NewRCoast]) :-
    member(b, LCoast),
    delete(LCoast, b, TempLCoast),
    append(Head, [k, k |Tail],TempLCoast),
    append(Head, Tail, SecTempLCoast),
    append(RCoast, [k, k, b], TempRCoast),
    sort_items(SecTempLCoast, NewLCoast),
    sort_items(TempRCoast, NewRCoast),
    balance(NewLCoast),
    balance(NewRCoast).
%KKK->
move([LCoast, RCoast], [NewLCoast, NewRCoast]) :-
    member(b, LCoast),
    delete(LCoast, b, TempLCoast),
    append(Head, [k, k, k |Tail],TempLCoast),
    append(Head, Tail, SecTempLCoast),
    append(RCoast, [k, k, k, b], TempRCoast),
    sort_items(SecTempLCoast, NewLCoast),
    sort_items(TempRCoast, NewRCoast),
    balance(NewLCoast),
    balance(NewRCoast).
%M->
move([LCoast, RCoast], [NewLCoast, NewRCoast]) :-
    member(b, LCoast),
    delete(LCoast, b, TempLCoast),
    append(Head, [m |Tail],TempLCoast),
    append(Head, Tail, SecTempLCoast),
    append(RCoast, [m, b], TempRCoast),
    sort_items(SecTempLCoast, NewLCoast),
    sort_items(TempRCoast, NewRCoast),
    balance(NewLCoast),
    balance(NewRCoast).
%MM->
move([LCoast, RCoast], [NewLCoast, NewRCoast]) :-
    member(b, LCoast),
    delete(LCoast, b, TempLCoast),
    append(Head, [m, m |Tail],TempLCoast),
    append(Head, Tail, SecTempLCoast),
    append(RCoast, [m, m, b], TempRCoast),
    sort_items(SecTempLCoast, NewLCoast),
    sort_items(TempRCoast, NewRCoast),
    balance(NewLCoast),
    balance(NewRCoast).
%MMM->
move([LCoast, RCoast], [NewLCoast, NewRCoast]) :-
    member(b, LCoast),
    delete(LCoast, b, TempLCoast),
    append(Head, [m, m, m |Tail],TempLCoast),
    append(Head, Tail, SecTempLCoast),
    append(RCoast, [m, m, m, b], TempRCoast),
    sort_items(SecTempLCoast, NewLCoast),
    sort_items(TempRCoast, NewRCoast),
    balance(NewLCoast),
    balance(NewRCoast).
%KM->
move([LCoast, RCoast], [NewLCoast, NewRCoast]) :-
    member(b, LCoast),
    delete(LCoast, b, TempLCoast),
    append(Head, [k, m |Tail],TempLCoast),
    append(Head, Tail, SecTempLCoast),
    append(RCoast, [k, m, b], TempRCoast),
    sort_items(SecTempLCoast, NewLCoast),
    sort_items(TempRCoast, NewRCoast),
    balance(NewLCoast),
    balance(NewRCoast).
%KMM->
move([LCoast, RCoast], [NewLCoast, NewRCoast]) :-
    member(b, LCoast),
    delete(LCoast, b, TempLCoast),
    append(Head, [k, m, m |Tail],TempLCoast),
    append(Head, Tail, SecTempLCoast),
    append(RCoast, [k, m, m, b], TempRCoast),
    sort_items(SecTempLCoast, NewLCoast),
    sort_items(TempRCoast, NewRCoast),
    balance(NewLCoast),
    balance(NewRCoast).
% <- M
move([LCoast, RCoast], [NewLCoast, NewRCoast]) :-
    member(b, RCoast),
    delete(RCoast, b, TempRCoast),
    append(Head, [m | Tail], TempRCoast),
    append(Head, Tail, SecTempRCoast),
    append(LCoast, [m, b], TempLCoast),
    sort_items(TempLCoast, NewLCoast),
    sort_items(SecTempRCoast, NewRCoast),
    balance(NewLCoast),
    balance(NewRCoast).
% <- MM
move([LCoast, RCoast], [NewLCoast, NewRCoast]) :-
    member(b, RCoast),
    delete(RCoast, b, TempRCoast),
    append(Head, [m, m | Tail], TempRCoast),
    append(Head, Tail, SecTempRCoast),
    append(LCoast, [m, m, b], TempLCoast),
    sort_items(TempLCoast, NewLCoast),
    sort_items(SecTempRCoast, NewRCoast),
    balance(NewLCoast),
    balance(NewRCoast).
% <- MMM
move([LCoast, RCoast], [NewLCoast, NewRCoast]) :-
    member(b, RCoast),
    delete(RCoast, b, TempRCoast),
    append(Head, [m, m, m | Tail], TempRCoast),
    append(Head, Tail, SecTempRCoast),
    append(LCoast, [m, m, m, b], TempLCoast),
    sort_items(TempLCoast, NewLCoast),
    sort_items(SecTempRCoast, NewRCoast),
    balance(NewLCoast),
    balance(NewRCoast).
%<-KM
move([LCoast, RCoast], [NewLCoast, NewRCoast]) :-
    member(b, RCoast),
    delete(RCoast, b, TempRCoast),
    append(Head, [k, m | Tail], TempRCoast),
    append(Head, Tail, SecTempRCoast),
    append(LCoast, [k, m, b], TempLCoast),
    sort_items(TempLCoast, NewLCoast),
    sort_items(SecTempRCoast, NewRCoast),
    balance(NewLCoast),
    balance(NewRCoast).
%<-KMM
move([LCoast, RCoast], [NewLCoast, NewRCoast]) :-
    member(b, RCoast),
    delete(RCoast, b, TempRCoast),
    append(Head, [k, m, m | Tail], TempRCoast),
    append(Head, Tail, SecTempRCoast),
    append(LCoast, [k, m, m, b], TempLCoast),
    sort_items(TempLCoast, NewLCoast),
    sort_items(SecTempRCoast, NewRCoast),
    balance(NewLCoast),
    balance(NewRCoast).
% <- K
move([LCoast, RCoast], [NewLCoast, NewRCoast]) :-
    member(b, RCoast),
    delete(RCoast, b, TempRCoast),
    append(Head, [k | Tail], TempRCoast),
    append(Head, Tail, SecTempRCoast),
    append(LCoast, [k, b], TempLCoast),
    sort_items(TempLCoast, NewLCoast),
    sort_items(SecTempRCoast, NewRCoast),
    balance(NewLCoast),
    balance(NewRCoast).
% <- KK
move([LCoast, RCoast], [NewLCoast, NewRCoast]) :-
    member(b, RCoast),
    delete(RCoast, b, TempRCoast),
    append(Head, [k,k | Tail], TempRCoast),
    append(Head, Tail, SecTempRCoast),
    append(LCoast, [k,k, b], TempLCoast),
    sort_items(TempLCoast, NewLCoast),
    sort_items(SecTempRCoast, NewRCoast),
    balance(NewLCoast),
    balance(NewRCoast).
% <- KKK
move([LCoast, RCoast], [NewLCoast, NewRCoast]) :-
    member(b, RCoast),
    delete(RCoast, b, TempRCoast),
    append(Head, [k,k,k | Tail], TempRCoast),
    append(Head, Tail, SecTempRCoast),
    append(LCoast, [k,k,k, b], TempLCoast),
    sort_items(TempLCoast, NewLCoast),
    sort_items(SecTempRCoast, NewRCoast),
    balance(NewLCoast),
    balance(NewRCoast).

prolong([OldState | States], [NewState, OldState | States]) :-
    move(OldState, NewState),
    not(member(NewState, [OldState | States])).

depth([Finish | States], Finish, [Finish | States]).
depth(CurrState, Finish, Ways) :-
    prolong(CurrState, NewWay),
    depth(NewWay, Finish, Ways).

depth_search(Start, Finish):-
    get_time(DFSStart),
	depth([Start], Finish, Way),
	print_way(Way),
    print_answer(Way),
    get_time(DFSEnd),
    nl,
    Time is DFSEnd - DFSStart,
    write('Time is '), write(Time), nl.


print_way([_]).
print_way([_, B | Tail]):-
	print_way([B | Tail]),
	nl,
	write(B).
	
print_answer([A | _]):-
	nl,
	write(A),
	nl.

breadth_search(Start, Finish):-
    get_time(BFSStart),
	breadth([[Start]], Finish, Way),
	print_way(Way),
	print_answer(Way),
    get_time(BFSEnd),
    nl,
    Time is BFSEnd - BFSStart,
    write('Time is '), write(Time), nl.


breadth([[Finish | Tail] | _], Finish, [Finish | Tail]).
breadth([TempWay | OtherWays], Finish, Way):-
	findall(W, prolong(TempWay, W), Ways),
	append(OtherWays, Ways, NewWays),
	breadth(NewWays, Finish, Way).

int(1).
int(N):- int(M), N is M + 1.

iter_search(Start, Finish):-
    get_time(IterStart),
	int(Level),
	(
		Level > 100, !;
		id([Start], Finish, Way, Level), print_way(Way), print_answer(Way)
    ),
    get_time(IterEnd), nl,
    Time is IterEnd - IterStart,
    write('Time is '), write(Time), nl.

id([Finish | Tail], Finish, [Finish | Tail], 0).
id(TempWay, Finish, Way, N):-
	N > 0,
	prolong(TempWay, NewWay),
	N1 is N - 1,
	id(NewWay, Finish, Way, N1).
