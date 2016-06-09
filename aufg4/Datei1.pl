% Autor:
% Datum: 07.06.2016

gleich(brite,rot).
gleich(schwede,hund).
gleich(dane,tee).

links(gruen,weiss).

gleich(gruen,kaffee).
gleich(pallmall,vogel).
gleich(haus3,milch).
gleich(gelb,dunhill).
gleich(norweger,haus1).

neben(malboro,katze).
neben(pferd,dunhill).

gleich(winfield,bier).
gleich(norweger,blau).
gleich(deutscher,rothmanns).

neben(malboro,wasser).

gleich(VX,VY) :- VX = VY.
links(VX,VY) :- VXT is VX + 1,
                VXT = VY.
rechts(VX,VY) :- VXT is VX - 1,
                 VXT = VY.
neben(VX,VY) :- links(VX,VY).
neben(VX,VY) :- rechts(VX,VY).

domains([brite, schwede, dane, norweger, deutscher,
         rot, gruen, weiss, blau, gelb,
         hund, katze, vogel, pferd, fisch,
         tee, wasser, milch, bier, kaffee,
         pallmall, dunhill, malboro, winfield, rothmanns]).
domainsH([haus1, haus2, haus3, haus4, haus5]).


domainBuild([],_,[]).
domainBuild([D|R],X,[(D,X)|DAll]) :- domainBuild(R,X,DAll).
domainBuildH([],X,[]) :- domainsH(XX) ,length(XX,X).
domainBuildH([D|R],Y,[(D,[X])|DAll]) :- domainBuild(R,X,DAll),
                                      Y is X - 1.
domainBuild(D,DAll) :- domains(DT),
                       domainBuild(DT,[1,2,3,4,5],DAllT),
                       domainsH(DHT),
                       domainBuildH(DHT,_,DAllH),
                       append(DAllT,DAllH,DAll),
                       append(DT,DHT,D).
                       







