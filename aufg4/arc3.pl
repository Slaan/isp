% Autor:
% Datum: 07.06.2016

%DAll [(vogel,[0,..]),...]
%D    [vogel,...]
%R2   [gleich,..]


%WL [(x,y),...]

ac3(D,DAll,R2,End,Algo,CV) :- buildWorkItems(_,_,D,R2,WL,buildWorkItemsHInit,Algo,CV),
                          !,arcWhile(WL,D,DAll,R2,End,Algo,CV).


arcWhile([],_,DAll,_,DAll,_,_).
arcWhile([(R,X,Y)|WLR],D,DAll,R2,End,Algo,CV) :- member((X,DX),DAll),
                                            member((Y,DY),DAll),
                                            arcReduce(DX,DY,NDX,R2,R),
                                            delete(DAll,(X,_),DAllT1),
                                            DAllT2 = [(X,NDX)|DAllT1],
                                            !,arcIfReduce(X,DX,NDX,Y,D,R2,WR,Algo,CV),
                                            append(WR,WLR,WL),
                                            !,arcWhile(WL,D,DAllT2,R2,End,Algo,CV).

arcIfReduce(X,DX,NDX,Y,D,R2,WR,Algo,CV) :- length(DX,LDX),
                                           length(NDX,LNDX),
                                           LDX  \== LNDX,
                                           !,arcIfDomain(X,Y,D,R2,WR,NDX,Algo,CV).
arcIfReduce(_,_,_,_,_,_,_,_,_).

arcReduce([],_,[],_,_).
arcReduce([VX|DX],DY,[VX|NDX],R2,R) :-  arcReduce(DX,DY,NDX,R2,R),
                                        Call =.. [R,VX,DY,_],
                                        call(Call).
arcReduce([_|DX],DY,NDX,R2,R) :-  arcReduce(DX,DY,NDX,R2,R).

arcIfDomain(_,_,_,_,_,[],_,_) :- !,fail.
arcIfDomain(X,Y,D,R2,WR,_,Algo,CV) :- buildWorkItems(X,Y,D,R2,WR,buildWorkItemsH,Algo,CV).

buildWorkItems(X,Y,D,R2,WR,Ver,Algo,CV) :- concat(Ver,Algo,CallMeth),
                                           Call =.. [CallMeth,X,Y,D,R2,Z,R,CV],
                                           findall((R,X,Z),Call,Re),
                                           buildWorkItemsAdd(Re,WR).

buildWorkItemsHInitac3(X,_,D,R2,Z,R,_) :- member(R,R2),
                                          member(Z,D),
                                          member(X,D),
                                          X \== Z,
                                          concat(R,'H',RT),
                                          Call =.. [RT,X,Z],
                                          call(Call).

buildWorkItemsHac3(X,Y,D,R2,Z,R,_) :- member(R,R2),
                                      member(Z,D),
                                      Y \== Z,
                                      X \== Z,
                                      concat(R,'H',RT),
                                      Call =.. [RT,X,Z],
                                      call(Call).

buildWorkItemsHInitac3La(X,_,D,R2,Z,R,CV) :- usableD(CV,D,UD),
                                             member(R,R2),
                                             member(X,UD),
                                             Z = CV,
                                             concat(R,'H',RT),
                                             Call =.. [RT,X,CV],
                                             call(Call).

buildWorkItemsHac3La(X,Y,D,R2,Z,R,CV) :- usableD(CV,D,UD),
                                       member(R,R2),
                                       member(Z,UD),
                                       Y \== Z,
                                       X \== Z,
                                       concat(R,'H',RT),
                                       Call =.. [RT,X,Z],
                                       call(Call).
usableD(_,[],[]).
usableD(CV,[CV|DR],DR).
usableD(CV,[D|DR],UD) :- usableD(CV,DR,UD).
                               
buildWorkItemsAdd([],[]).
buildWorkItemsAdd([(notequal,X,Y)|WI],[(notequal,X,Y)|WR]) :- buildWorkItemsAdd(WI,WR).
buildWorkItemsAdd([(links,X,Y)|WI],[(links,X,Y)|[(rechts,Y,X)|WR]]) :- buildWorkItemsAdd(WI,WR).
buildWorkItemsAdd([(R,X,Y)|WI],[(R,X,Y)|[(R,Y,X)|WR]]) :- buildWorkItemsAdd(WI,WR).