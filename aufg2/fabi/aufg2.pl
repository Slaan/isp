s(SemS) --> ergF(SemS).
s(SemS) --> entF(SemS).
s(SemS) --> aS(SemS).

aS([SemNP,SemVP]) --> np(SemNP,N), vp(SemVP,N).
ergF([SemVP,SemNP]) --> vp(SemVP,N), np(SemNP,N).
entF([SemI,SemVP]) --> ip(SemI,_), vp(SemVP,_).

np(SemNP,N) --> n(SemNP,N).
np(SemNP,N) --> det(_), n(SemNP,N).
np([SemN,SemPP],N) --> det(_), n(SemN,N), pp(SemPP,N).

pp(SemPP,N) --> p(_), np(SemPP,N).

vp(SemVP,N) --> v(SemVP,N).
vp([SemN,SemNP],N) --> v(SemN,N), np(SemNP,_).

pn(SemPN,N)--> [X], {lex(X,SemPN,pn,N)}.
n(SemN,N)--> [X], {lex(X,SemN,na,N)}.
n(SemN,N)--> [X], {lex(X,SemN,bz,N)}.
v(SemV,N)--> [X], {lex(X,SemV,v,N)}.
det(_)--> [X], {lex(X,_,det,_)}.
ip(SemI,_)--> [X], {lex(X,SemI,ip,_)}.
p(_)--> [X], {lex(X,_,p,_)}.

lex(wer,who,ip,_).

lex(ist,be,v,sg).

lex(der,the,det,_).
lex(dem,the,det,_).
lex(die,the,det,_).

lex(onkel,uncle,bz,sg).
lex(tante,aunt,bz,sg).
lex(vater,father,bz,sg).

lex(von,from,p,_).

lex(sam,sam,na,sg).
lex(eve,eve,na,sg).
lex(franz,franz,na,sg).
lex(hans,hans,na,sg).
lex(maria,maria,na,sg).