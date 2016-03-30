:- consult('stammbaum').

father(X,Y) :- male(X), parent(X,Y).
mother(X,Y) :- female(X), parent(X,Y).
child(X,Y) :- parent(Y,X).
grandparent(X,Y) :- parent(Z,Y), parent(X,Z).
grandfather(X,Y) :- grandparent(X,Y), male(X).
grandmother(X,Y) :- grandparent(X,Y), female(X).
fullsibling(X,Y) :- father(Z,X), father(Z,Y), mother(A,X), mother(A,Y).
halfsibling(X,Y) :- mother(A,X), mother(A,Y); father(B,X), father(B,Y).
halfsister(X,Y) :- female(X), halfsibling(X,Y).
halfbrother(X,Y) :- male(X), halfsibling(X,Y).
cousin(X,Y) :- parent(A,X), parent(B,Y), fullsibling(A,B).
nephew(X,Y) :- child(X,A), fullsibling(Y,A).