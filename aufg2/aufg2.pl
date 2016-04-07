s(SemS) --> ergF(SemS).
s(SemS) --> entF(SemS).

entF(SemS) --> vp([SemV|_],N), np([SemW,SemO|_],N), {SemY = [SemW,SemV,SemO], SemS =.. SemY}.

ergF(SemS) --> ip(_), vp([SemW,SemO|_],_), {SemY = [SemW,X,SemO], SemS =.. SemY}.


np(SemX,N) --> n(SemN,N), {SemX = [SemN]}.
np(SemX,N) --> det(_), n(SemN,N), {SemX = [SemN]}.
np(SemX,N) --> det(_), n(SemN,N), pp(SemP,_), {append([SemN],SemP,SemX)}.

pp(SemP,N) --> p(_), np(SemP,N).

vp(SemN,N) --> v(_SemV,N), np(SemN,N).
vp(_,N) --> v(_SemV,N).

pn(SemN,N) --> [X], {lex(X,SemN,pn,N)}.
n(SemN,N) --> [X], {lex(X,SemN,n,N)}.
v(SemV,N) --> [X], {lex(X,SemV,v,N)}.
det(_) --> [X], {lex(X,_,det,_)}.
ip(_) --> [X], {lex(X,_,ip,_)}.
p(_) --> [X], {lex(X,_,p,_)}.

lex(wer,who,ip,_).

lex(ist,be,v,sg).

lex(der,_,det,_).
lex(die,_,det,_).

lex(onkel,uncle,n,sg).

lex(von,_,p,_).

lex(franz,franz,n,sg).
lex(hans,hans,n,sg).
lex(maria,maria,n,sg).
