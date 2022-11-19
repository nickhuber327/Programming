male(nick).
male(paul).
male(rich).
male(joe).
male(brian).
male(cooper).
female(jacquelynn).
female(laura).
female(miranda).

parent(paul, nick).
parent(paul, jacquelynn).
parent(rich, paul).
parent(rich, brian).
parent(laura, nick).
parent(laura, jacquelynn).
parent(jacquelynn, cooper).
parent(brian, joe).

spouse(paul, laura).

married(X,Y).
married(Y,X).

mother(M,C):-
    parent(M,C),
    female(M).
father(F,C):-
    parent(F,C),
    male(F).
sibling(A,B):-
    parent(X,A),
    parent(X,B),
    \==(A,B).
cousin(A,B) :-
    parent(X,A),
    sibling(X,Y),
    parent(Y,B),
    \==(A,B).
uncle(A,Y) :-
    parent(X,A),
    sibling(X,Y),
    male(Y).
aunt(A,Y) :-
    parent(X,A),
    sibling(X,Y),
    female(Y).
grandparent(X,Y) :-
    parent(A,X),
    parent(Y,A).
