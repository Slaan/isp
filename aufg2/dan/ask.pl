:- consult('aufg2').
:- consult('readsentence').


ask((Goal),[Variable],[X|[Y|[Z|[]]]]) :- lex(_,X,na,_,_,_), Goal =.. [Y,X,Z].
ask((Goal),[Variable],[Y|[Z|[]]]) :- lex(_,X,bz,_,_,_), Goal =.. [Y,Variable,Z].
ask((OldGoals,Goal),[Variable],[X|[Y|[Z|R]]]) :- lex(_,X,na,_,_,_), lex(_,Y,bz,_,_,_), ask(OldGoals,[Variable],[Z|R]), Goal =.. [Y,X,Variable],!.
ask((OldGoals,Goal),[Variable|[OldVariable|RestVariable]],[X|[Y|[Z|R]]]) :- lex(_,X,bz,_,_,_), lex(_,Y,bz,_,_,_), ask(OldGoals,[OldVariable|RestVariable],[Y|[Z|R]]), Goal =.. [X,Variable,OldVariable].

ask([XX|XXX]) :- flatten([XX|XXX],[X|[Y|R]]),X==who, Y==be, ask(W,[LL|L],R), call(W), s([LL|XXX],BB,[]), writer(BB),!.
ask([XX|XXX]) :- flatten([XX|XXX],[X|R]),X==be,ask(W,[LL|L],R),(call(W),write('ja');write('nö')),!.

writer([]) :- write('!').
writer([H|T]) :- write(' '), write(H), writer(T).

answering(F,W,[LL|L],BB) :- s([XX|X],F,[]), ask([XX|X]).

main(_) :- read_sentence(QuestionW), reverse(QuestionW,[M|QuestionR]), reverse(QuestionR,Question), answering(Question,_,_,C).
