notequal(VX,DY,_) :- !,length(DY,1),
                     not(member(VX,DY)).
notequal(VX,DY,_).

gleich(VX,DY,_) :- member(VY,DY),
                   VX = VY.
links(VX,DY,_) :- member(VY,DY),
                  VXT is VX + 1,
                  VXT = VY.
rechts(VX,DY,_) :- member(VY,DY),
                   VXT is VX - 1,
                   VXT = VY.
neben(VX,DY,_) :- links(VX,DY,_).
neben(VX,DY,_) :- rechts(VX,DY,_).

domainBuild([],_,[]).
domainBuild([D|R],X,[(D,X)|DAll]) :- domainBuild(R,X,DAll).
domainBuildH([],X,[]) :- domainsH(XX) ,length(XX,X).
domainBuildH([D|R],Y,[(D,[X])|DAll]) :- domainBuildH(R,X,DAll),
                                        Y is X - 1.
domainBuild(D,DAll) :- domains(DT),
                       domainBuild(DT,[1,2,3,4,5],DAllT),
                       domainsH(DHT),
                       domainBuildH(DHT,_,DAllH),
                       append(DAllT,DAllH,DAll),
                       append(DT,DHT,D).

einstein() :- domainBuild(D,DAll),
              constraints(R2),
              ac3(D,DAll,R2).









