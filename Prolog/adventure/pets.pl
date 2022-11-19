pet(dog):- size(medium), noise(woof).
pet(cat):- size(medium), noise(meow).
pet(mouse):- size(small), noise(squeek).

size(X):- ask(size,X).
noise(X):- ask(noise,X).

ask(Attr, Val):-
    known(yes, Attr, Val),
    fail.
ask(Attr,Val):-
    known(_,Attr,Val),
    fail.
ask(Attr,Val):-
    not(known(Answer,Attr,Val)).
ask(Attr, Val):-
    write(Attr),tab(1),write(Val),
    tab(1),write('(yes/no)'),write(?),
    read(X),
    X = yes.
