gleich(brite,1).
gleich(norweger,1).
gleich(norweger,1).
gleich(norweger,1).
gleich(norweger,1).


notequal(X,Y) :- domainsList(DL),
                 member(D,DL),
                 Call =.. [D,ZD],
                 call(Call),
                 member(X,ZD),
                 member(Y,ZD).

constraints([gleich,neben,links,notequal]).

domainsList([domainsN,domainsC,domainsP,domainsD,domainsS]).
domains(R) :- domainsN(N),
              domainsC(C),
              domainsP(P),
              domainsD(D),
              domainsS(S),
              append([N,C,P,D,S],R).
domainsN([brite, schwede]).
domainsC([rot, gruen]).
domainsH([haus1, haus2]).







