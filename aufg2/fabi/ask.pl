ask((Goal),[],[X|[Y|[Z|[]]]]) :- lex(_,X,na,_,_,_), Goal =.. [Y,X,Z].
ask((Goal),[Variable],[Y|[Z|[]]]) :- lex(_,X,bz,_,_,_), Goal =.. [Y,Variable,Z].
ask((OldGoals,Goal),[Variable],[X|[Y|[Z|R]]]) :- lex(_,X,na,_,_,_), ask(OldGoals,[Variable],[Y|[Z|R]]), Goal =.. [Y,X,Variable],!.
ask((OldGoals,Goal),[Variable|[OldVariable|RestVariable]],[X|[Y|[Z|R]]]) :- lex(_,X,bz,_,_,_), ask(OldGoals,[OldVariable|RestVariable],[Y|[Z|R]]), Goal =.. [Y,Variable,OldVariable].
ask(Goals,Variable,[X|R]) :- ask(Goals,Variable,R),!.

xxx(F,W,[LL|L],BB) :- s([XX|X],F,[]),flatten([XX|X],XF), ask(W,[LL|L],XF), call(W), s([LL|X],BB,[]).

main(Goal) :- read_sentence(QuestionW),reverse(QuestionW,[M|QuestionR]), reverse(QuestionR,Question),  s([Sem|SemRest],Question,[]), flatten([Sem|SemRest],SemFlattened), ask(Goal,[Varbiale|Rest],SemFlattened), call(Goal), s([Variable|SemRest],Answer,[]).