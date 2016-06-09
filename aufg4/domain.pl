% Autor:
% Datum: 07.06.2016

gleich(norweger,haus1).
gleich(norweger,blau).
gleich(haus3,milch).
gleich(brite,rot).
gleich(schwede,hund).
gleich(dane,tee).
gleich(gruen,kaffee).
gleich(pallmall,vogel).
gleich(gelb,dunhill).
gleich(winfield,bier).
gleich(deutscher,rothmanns).

links(gruen,weiss).

neben(malboro,katze).
neben(pferd,dunhill).
neben(malboro,wasser).

notequal(X,Y) :- domainsList(DL),
                 member(D,DL),
                 Call =.. [D,ZD],
                 call(Call),
                 member(X,ZD),
                 member(Y,ZD).

constraints([gleich,neben,links,notequal]).
domainsN([brite, schwede, dane, norweger, deutscher]).
domainsC([rot, gruen, weiss, blau, gelb]).
domainsP([hund, katze, vogel, pferd, fisch]).
domainsD([tee, wasser, milch, bier, kaffee]).
domainsS([pallmall, dunhill, malboro, winfield, rothmanns]).
domainsH([haus1, haus2, haus3, haus4, haus5]).

domainsList([domainsN,domainsC,domainsP,domainsD,domainsS]).

domains(R) :- domainsN(N),
              domainsC(C),
              domainsP(P),
              domainsD(D),
              domainsS(S),
              append([N,C,P,D,S],R).









