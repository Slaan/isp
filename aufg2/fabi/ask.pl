ask((Goal),[],[X|[Y|[Z|[]]]]) :- lex(_,X,na,_), Goal =.. [Y,X,Z].
ask((Goal),[Variable],[X|[Y|[Z|[]]]]) :- lex(_,X,bz,_), Goal =.. [Y,Variable,Z].
ask((OldGoals,Goal),[Variable],[X|[Y|[Z|R]]]) :- lex(_,X,na,_), ask(OldGoals,[Variable],[Y|[Z|R]]), Goal =.. [Y,X,Variable],!.
ask((OldGoals,Goal),[Variable|[OldVariable|RestVariable]],[X|[Y|[Z|R]]]) :- lex(_,X,be,_), ask(OldGoals,[OldVariable|RestVariable],[Y|[Z|R]]), Goal =.. [Y,Variable,OldVariable].
ask(Goals,Variable,[X|[Y|[Z|R]]]) :- lex(_,be,_,_), ask(Goals,Variable,[Y|[Z|R]]),!.
ask(Goals,Variable,[X|[Y|[Z|R]]]) :- lex(_,who,_,_), ask(Goals,Variable,[Y|[Z|R]]),!.

xxx(F,W,H) :- s(X,F,[]), ask(W,H,X), call(W).