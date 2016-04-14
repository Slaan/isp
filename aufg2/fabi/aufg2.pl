s(SemS) --> ergF(SemS).
s(SemS) --> entF(SemS).
s(SemS) --> aS(SemS).

aS([SemNP,SemVP]) --> np(SemNP,N), vp(SemVP,N).
ergF([SemVP,SemNP]) --> vp(SemVP,N), np(SemNP,N).
entF([SemI,SemVP]) --> ip(SemI,_), vp(SemVP,_).

np(SemNP,N) --> n(SemNP,N,_).
np(SemNP,N) --> det(_,Gen,nom), n(SemNP,N,Gen).
np([SemN,SemPP],N) --> det(_,Gen,nom), n(SemN,N,Gen), pp(SemPP,N).

np(SemNP,N,_) --> n(SemNP,N,_).
np(SemNP,N,_) --> det(_,Gen,dat), n(SemNP,N,Gen).
np([SemN,SemPP],N,_) --> det(_,Gen,nom), n(SemN,N,Gen), pp(SemPP,N).

pp(SemPP,N) --> p(_), np(SemPP,N,_).

vp(SemVP,N) --> v(SemVP,N).
vp([SemN,SemNP],N) --> v(SemN,N), np(SemNP,_).

pn(SemPN,N)--> [X], {lex(X,SemPN,pn,N)}.
n(SemN,N,Gen)--> [X], {lex(X,SemN,na,N,Gen,_)}.
n(SemN,N,Gen)--> [X], {lex(X,SemN,bz,N,Gen,_)}.
v(SemV,N)--> [X], {lex(X,SemV,v,N,_,_)}.
det(_,Gen,Casus)--> [X], {lex(X,_,det,_,Gen,Casus)}.
ip(SemI,_)--> [X], {lex(X,SemI,ip,_,_,_)}.
p(_)--> [X], {lex(X,_,p,_,_,_)}.

lex(wer,who,ip,_,_,_).

lex(ist,be,v,sg,_,_).

lex(der,the,det,_,male,nom).
lex(die,the,det,_,female,nom).
lex(der,the,det,_,female,dat).
lex(dem,the,det,_,male,dat).

lex(onkel,uncle,bz,sg,male,_).
lex(tante,aunt,bz,sg,female,_).
lex(vater,father,bz,sg,male,_).
lex(mutter,mother,bz,sg,female,_).

lex(von,from,p,_,_,_).

lex(sam,sam,na,sg,male,_).
lex(eve,eve,na,sg,female,_).
lex(franz,franz,na,sg,male,_).
lex(hans,hans,na,sg,male,_).
lex(maria,maria,na,sg,female,_).
lex(dan,dan,na,sg,male,_).
