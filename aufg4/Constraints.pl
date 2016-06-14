notequal(VX,DY,_) :- length(DY,1),
                     not(member(VX,DY)).
notequal(VX,DY,_) :- length(DY,L),
                     L > 1.

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

einstein(End) :- domainBuild(D,DAll),
              constraints(R2),
              ac3(D,DAll,R2,DAllcleaned,ac3,_),
              solveWithac3La(D,D,DAllcleaned,R2,End).


solveWithac3La(_,[],DAll,_,DAll).
solveWithac3La(_,[CV|_],DAll,_,_) :- member((CV,[]),DAll), fail.
solveWithac3La(D,[CV|RCV],DAll,R2,End) :- member((CV,[VCV|DCV]),DAll),
                                          delete(DAll,(CV,_),DAllT1),
                                          DAllT2 = [(CV,[VCV])|DAllT1],
                                          ac3(D,DAllT2,R2,DAllT3,ac3La,CV),
                                          solveWithac3La(D,RCV,DAllT3,R2,End).
solveWithac3La(D,[CV|RCV],DAll,R2,End) :- member((CV,[VCV|DCV]),DAll),
                                          delete(DAll,(CV,_),DAllT1),
                                          DAllT2 = [(CV,DCV)|DAllT1],
                                          solveWithac3La(D,[CV|RCV],DAllT2,R2,End).



