% Autor:
% Datum: 07.06.2016

%DAll [(vogel,[0,..]),...]
%D    [vogel,...]
%R2   [gleich,..]


%WL [(x,y),...]

arcWhile([],_,_,_).
arcWhile([(X,Y)|WLR],D,DAll,R2) :- member((X,DX),DAll),
                                   member((Y,DY),DAll),
                                   arcReduce(DX,DY,NDX),
                                   delete(DAll,(X,_),DAllT1),
                                   DAllT2 is [(X,NDX)|DAllT1],
                                   arcIfReduce(X,,NX,Y,D,DAllT2,R2,WT),



                                   arcWhile(WLR,D,DAllT2,R2T).


arcIfReduce(X,NX,Y,D,DAll,R2) :- length(DX,LDX),
                                 length(NDX,LNDX),
                                 LDX  \== LNDX,
                                 arcIfDomain(X,NX,Y,D,DAll,R2).
arcIfReduce(X,NX,Y,D,DAll,R2).
                    
arcReduce([],_,[]).
arcReduce([VX|DX],DY,[VX|NDX]) :-  arcReduce(DX,DY,NDX),
                                   member(VY,DY),
                                   satisfyConst(VX,VY),!.
                                   
arcReduce([VX|DX],DY,NDX) :-  arcReduce(DX,DY,NDX).


                  %für alle
satisfyConst(VX,VY) :- gleich(VX,VY).

arcIfDomain(_,[],_,_,_,_) :- fail.
%arcIfDomain(X,NX,Y,D,DAll,R2) :- findall(
%                                 .

buildNewWorkItems(X,NX,Y,D,DAll,R2) :- member(R,R2),
                                       member(Z,D),
                                       Y \== Z,
                                       member((Z,DZ),DAll),
                                       member(VX,NX),
                                       member(VZ,DZ),
                                       call(R(VX,VZ)).  %call ändern

gleich(h,1).
gleich(x,2).