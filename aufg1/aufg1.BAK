:- consult('stammbaum').

father(X,Y) :- parent(X,Y), male(X).
mother(X,Y) :- parent(X,Y), female(X).
child(X,Y) :- parent(Y,X).
grandparent(X,Y) :- parent(Z,Y), parent(X,Z).
grandfather(X,Y) :- not(female(X)), grandparent(X,Y).
grandmother(X,Y) :- grandparent(X,Y), female(X).
fullsibling(X,Y) :- father(Z,X), father(Z,Y), mother(A,X), mother(A,Y), X \= Y.
halfsibling(X,Y) :- mother(A,X), mother(A,Y), \+ (father(B,X), father(B,Y)), X \= Y.
halfsibling(X,Y) :- father(B,X), father(B,Y), \+ (mother(A,X), mother(A,Y)), X \= Y.
halfsister(X,Y) :- halfsibling(X,Y), female(X).
halfbrother(X,Y) :- halfsibling(X,Y), male(X).
cousin(X,Y) :- parent(A,X), fullsibling(A,B), parent(B,Y).
nephew(X,Y) :- fullsibling(Y,A), child(X,A).