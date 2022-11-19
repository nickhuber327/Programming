room(kitchen).
room(office).
room(hall).
room('dining room').
room(cellar).

door(office, hall).
door(kitchen, office).
door(hall, 'dining room').
door(kitchen, cellar).
door('dining room', kitchen).

location(desk, office).
location(apple, kitchen).
location(flashlight, desk).
location('washing machine', cellar).
location(nani, 'washing machine').
location(broccoli, kitchen).
location(crackers, kitchen).
location(computer, office).

edible(apple).
edible(crackers).

tastes_yucky(broccoli).

turned_off(flashlight).

here(kitchen).

connect(X,Y) :- door(X,Y).
connect(X,Y) :- door(Y,X)

list_things(Place) :-
    location(X,Place),
    tab(2),
    write(X),
    nl,
    fail.
list_things(_).

list_connections(Place) :-
    connect(Place,X),
    tab(2),
    write(X),
    nl,
    fail.
list_connections(_).

look :-
    here(Place),
    write('You are in the '), write(Place),
    write('You can see:'), nl,
    list_things(Place),
    write('You can go to:'), nl,
    list_connections(Place).

look_in(X) :-
    write('There is:'),nl,
    list_things(X),nl,
    write('in the '), write(X),nl.

goto(Place):-
    can_go(Place),
    move(Place),
    look.

can_go(Place):-
    here(X),
    connect(X,Place).
can_go(Place):-
    write('You can"t get there from here.'),nl,
    fail.

move(Place):-
    retract(here(X)),
    asserta(here(Place)).

take(X):-
    can_take(X),
    take_object(X).

can_take(Thing) :-
    here(Place)
    location(Thing, Place).
can_take(Thing):-
    write('There is no '), write(Thing),
    write(' here.'),
    nl, fail.

take_object(X):-
    retract(location(X,_)),
    asserta(have(X)),
    write('taken'),nl.

put(X):-
    here(Place),
    retract(have(X)),
    asserta(location(X,Place)).
