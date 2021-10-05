father('Александр Тарпанов', 'Даниил Тарпанов').
father('Николай Тарпанов', 'Александр Тарпанов').
father('Валерий Дацко', 'Инна Дацко').
father('Александр Тарпанов', 'Ева Тарпанова').
father('Иван Тарпанов', 'Николай Тарпанов').
father('Юрий Подойников', 'Людмила Подойникова').
father('Иван Дацко', 'Валерий Дацко').
father('Алексей Ефремов', 'Лариса Ефремова').
father('Юрий Подойников', 'Светлана Подойникова').
father('Олег Долгих', 'Ольга Долгих').
father('Эдуард Семенов', 'Максим Семенов').
father('Николай Тарпанов', 'Анна Иваневская').
father('Александр Иваневский', 'Юлия Иваневская').
father('Александр Иваневский', 'Алина Иваневская').
father('Алексей Ефремов', 'Светлана Ефремова').
father('Олег Капцилович', 'Наталия Капцилович').
father('Олег Капцилович', 'Елена Капцилович').
father('Степан Благодарев', 'Алексей Благодарев').
father('Роман Алексеев', 'Иван Алексеев').
father('Даниил Тарпанов', 'NULL ').
father('Алексей Благодарев', 'NULL ').
father('Иван Алексеев', 'NULL ').
father('Максим Семенов', 'NULL ').
mother('Инна Дацко', 'Даниил Тарпанов').
mother('Людмила Подойникова', 'Александр Тарпанов').
mother('Лариса Ефремова', 'Инна Дацко').
mother('Инна Дацко', 'Ева Тарпанова').
mother('Таисия Астахова', 'Николай Тарпанов').
mother('Татьяна Строкова', 'Людмила Подойникова').
mother('София Большенко', 'Валерий Дацко').
mother('Светлана Иванова', 'Лариса Ефремова').
mother('Татьяна Строкова', 'Светлана Подойникова').
mother('Светлана Подойникова', 'Ольга Долгих').
mother('Ольга Долгих', 'Максим Семенов').
mother('Людмила Подойникова', 'Анна Иваневская').
mother('Анна Иваневская', 'Юлия Иваневская').
mother('Анна Иваневская', 'Алина Иваневская').
mother('Светлана Иванова', 'Светлана Ефремова').
mother('Светлана Ефремова', 'Наталия Капцилович').
mother('Светлана Ефремова', 'Елена Капцилович').
mother('Наталия Капцилович', 'Алексей Благодарев').
mother('Елена Капцилович', 'Иван Алексеев').
mother('Юлия Иваневская', 'NULL ').
mother('Алина Иваневская', 'NULL ').
mother('Ева Тарпанова', 'NULL ').

%(man, brother-in-law)
brotherInLaw(Man, Bil) :-
    father(Man, Child),
    Child \= 'NULL ',
    mother(Mother, Child),
    father(Fil, Mother),
    father(Fil, Bil),
    father(Bil,_),
    Bil \= Mother.

%relativity

male(X) :-
    father(X,_).
female(X) :-
    mother(X, _).

relative_link(father, Father, X) :-
    father(Father, X),
    X \= 'NULL '.
relative_link(mother, Mother, X) :-
    mother(Mother, X),
    X \= 'NULL '.
relative_link(son, Son, X) :-
    father(X, Son),
    male(Son).
relative_link(son, Son, X) :-
    mother(X, Son),
    male(Son).
relative_link(daughter, Daughter, X) :-
    father(X, Daughter),
    female(Daughter).
relative_link(daughter, Daughter, X) :-
    mother(X, Daughter),
    female(Daughter).
relative_link(brother, Brother, X) :-
    father(Y, X),
    father(Y, Brother),
    X \= Brother,
    male(Brother).
relative_link(sister, Sister, X) :-
    father(Y, X),
    father(Y, Sister),
    X \= Sister,
    female(Sister).
relative_link(wife, Wife, Husband) :-
    mother(Wife, X),
    father(Husband, X),
    X \= 'NULL '.
relative_link(husband, Husband, Wife) :-
    father(Husband, X),
    mother(Wife, X),
    X \= 'NULL '.
relative_link(child, Child , Parent) :-
    father(Parent, Child) ; mother(Parent, Child),
    Child \= 'NULL ',
    Parent \= 'NULL '.

relative_link(sibling, Child1, Child2) :-
    father(X, Child1),
    father(X, Child2).
link(X) :-
    member(X, [father, mother, son, daughter, husband, wife, brother, sister]).
move(X, Y) :-
    relative_link(_, X, Y),
    Y \= 'NULL '.
prolong([X|T], [Y, X|T]) :-
    move(X,Y),
    not(member(Y, [X|T])).

breadth_search(Start, Finish, Result):-
	breadth([[Start]], Finish, Way),
    reverse(Way, Result).

breadth([[Finish | Tail] | _], Finish, [Finish | Tail]).
breadth([TempWay | OtherWays], Finish, Way):-
	findall(W, prolong(TempWay, W), Ways),
	append(OtherWays, Ways, NewWays),
	breadth(NewWays, Finish, Way).

names_to_relations([_], []) :- !.
names_to_relations([First, Second|Tail], Result) :-
    relative_link(Relation, First, Second),
    Result = [Relation | RecursiveRes],
    names_to_relations([Second|Tail], RecursiveRes), !.

relative(X, Y, Result) :-
    breadth_search(X,Y, TempRes),
    names_to_relations(TempRes, Result).

%Interface
chain_helper(X, [], Result) :-
    Result = X,!.
chain_helper(X, [TempRelative], Result) :-
    to_single_form(TempRelative, Relative),
    relative_link(Relative, Result, X),!.
chain_helper(X, [TempRelative|Tail], Result) :-
    to_single_form(TempRelative, Relative),
    relative_link(Relative, Y, X),
    chain_helper(Y, Tail, Res),
    Result = Res, !.

chain(X, Chain, Result) :-
    chain_helper(X, Chain, Result).

question_word(X) :-
    member(X, [does, is]).
    
name_word(X) :-
    father(X,_) ; mother(X, _).

context(X) :-
    member(X, [his, her, he, she]).

name_parser(X, Result) :-
    context(X),
    nb_getval(lastName, Result).
name_parser(X, Result) :-
    not(context(X)),
    Result = X.

person_parser([Name], Result) :-
    name_parser(Name, Result),
    nb_setval(lastName, Result).
person_parser(Sentence, Result) :-
    delete(Sentence, "'s", Temp),
    Temp = [TempName | RelativeChain],
    name_parser(TempName, Name),
    chain(Name, RelativeChain, Result),
    nb_setval(lastName, Result).

plural(X):-
    member(X, [sisters, brothers, children, sons, daughters, siblings]).

to_single_form(X, Result) :-
    not(plural(X)), Result = X.
to_single_form(X, Result) :-
    plural(X),
    X = sisters, Result = sister, !;
    X = brothers, Result = brother, !;
    X = children, Result = child, !;
    X = sons, Result = son, !;
    X = daughters, Result = daughter, !;
    X = siblings, Result = sibling, !.

does_parse(Sentence) :-
    append(X, [have|Tail], Sentence),
    person_parser(X, Person),
    delete(Tail, ?, TempTail),
    last(TempTail, TempRelative),
    to_single_form(TempRelative, Relative),
    (relative_link(Relative, Result, Person),
    write("Yes."), nl, !);
    write("No."), nl, !.

who_parse([Is | TempSentence]) :-
    delete(TempSentence, ?, Sentence),
    last(Sentence, TempRelative),
    delete(Sentence, TempRelative, TempName),
    person_parser(TempName, Name),
    to_single_form(TempRelative, Relative),
    (person_parser(Sentence, Person),
    write(Person), write(" is "), write(Name), write("'s "), write(Relative), nl, !);
    write("This person does not have this relative."), nl.

how_parse([Much, TempRelative | TempSentence]) :-
    to_single_form(TempRelative, Relative),
    delete(TempSentence, has, TempSentence1),
    delete(TempSentence1, ?, Sentence),
    person_parser(Sentence, Name),
    findall(Person, relative_link(Relative, Person, Name), TempResult),
    list_to_set(TempResult, TempResult1),
    delete(TempResult1, 'NULL ', Result),
    length(Result, Length),
    write(Name), write(" has "), write(Length), write(" "), write(TempRelative),  write(":"),
    nl,
    write(Result).

is_parse([Name|Sentence]) :-
    append(X, [Name2|Tail], Sentence),
    name_word(Name2),
    person_parser([Name|X], Result1),
    person_parser([Name2|Tail], Result2),
    (Result1 = Result2, write("Yes"), !);
    write("No").

analysis([Word|Tail]) :-
    %does X has Y?
    Word = does, does_parse(Tail), !;
    %who is X's Y?
    Word = who, who_parse(Tail), !;
    %how much X has Y?
    Word = how, how_parse(Tail), !;
    %Is X Y's Z?
    Word = is, is_parse(Tail), !.
    
