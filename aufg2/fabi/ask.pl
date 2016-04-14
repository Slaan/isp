ask((Goal),[],[Y|[Z|[]]]) :- lex(_,X,na,_), Goal =.. [Y,X,Z].
ask((Goal),[Variable],[Y|[Z|[]]]) :- lex(_,X,bz,_), Goal =.. [Y,Variable,Z].
ask((OldGoals,Goal),[Variable],[X|[Y|[Z|R]]]) :- lex(_,X,na,_), ask(OldGoals,[Variable],[Y|[Z|R]]), Goal =.. [Y,X,Variable],!.
ask((OldGoals,Goal),[Variable|[OldVariable|RestVariable]],[X|[Y|[Z|R]]]) :- lex(_,X,bz,_), ask(OldGoals,[OldVariable|RestVariable],[Y|[Z|R]]), Goal =.. [Y,Variable,OldVariable].
ask(Goals,Variable,[X|[Y|[Z|R]]]) :- ask(Goals,Variable,[Y|[Z|R]]),!.

xxx(F,W,[LL|L],BB) :- s([XX|X],F,[]),flatten([XX|X],XF), ask(W,[LL|L],XF), call(W), s([LL|X],BB,[]).