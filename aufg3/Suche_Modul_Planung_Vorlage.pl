% Die Schnittstelle umfasst
%   start_description   ;Beschreibung des Startzustands
%   start_node       ;Test, ob es sich um einen Startknoten handelt
%   goal_node           ;Test, ob es sich um einen Zielknoten handelt
%   state_member        ;Test, ob eine Zustandsbeschreibung in einer Liste 
%                        von Zustandsbeschreibungen enthalten ist
%   expand              ;Berechnung der Kind-Zustandsbeschreibungen
%   eval-path           ;Bewertung eines Pfades


/*start_description([
  block(block1),
  block(block2),
  block(block3),
  block(block4),  %mit Block4
  on(table,block2),
  on(table,block3),
  on(block2,block1),
  on(table,block4), %mit Block4
  clear(block1),
  clear(block3),
  clear(block4), %mit Block4
  handempty
  ]).

goal_description([
  block(block1),
  block(block2),
  block(block3),
  block(block4), %mit Block4
  on(block4,block2), %mit Block4
  on(table,block3),
  on(table,block1),
  on(block1,block4), %mit Block4
%  on(block1,block2), %ohne Block4
  clear(block3),
  clear(block2),
  handempty
  ]).*/

start_description([
  block(block1),
  block(block2),
  block(block3),
  block(block4),
  block(block5),
  block(block6),
  block(block7),
  block(block8),
  on(table, block1),
  on(table, block4),
  on(table, block6),
  handempty,
  clear(block3),
  clear(block5),
  clear(block8),
  on(block1, block2),
  on(block2, block3),
  on(block4, block5),
  on(block6, block7),
  on(block7, block8)
]).

goal_description([
  block(block1),
  block(block2),
  block(block3),
  block(block4),
  block(block5),
  block(block6),
  block(block7),
  block(block8),
  on(table, block6),
  on(table, block7),
  on(table, block5),
  handempty,
  clear(block6),
  clear(block8),
  clear(block1),
  on(block7, block8),
  on(block5, block4),
  on(block4, block3),
  on(block3, block2),
  on(block2, block1)
]).


start_node((start,_,_)).

goal_node((_,State,_)):-
  %Zielbedingungen einlesen
  goal_description(EndState),
  %Zustand gegen Zielbedingungen testen
  mysubset(EndState,State).



% Aufgrund der Komplexit�t der Zustandsbeschreibungen kann state_member nicht auf 
% das Standardpr�dikat member zur�ckgef�hrt werden.
%  
state_member(_,[]):- !,fail.

state_member(State,[FirstState|_]):-
  %Test, ob State bereits durch FirstState beschrieben war. Tipp: Eine L�sungsm�glichkeit besteht in der Verwendung einer Mengenoperation, z.B. subtract
  mysubset(State, FirstState),!.

%Es ist sichergestellt, dass die beiden ersten Klauseln nicht zutreffen.
state_member(State,[_|RestStates]):-  
  %rekursiver Aufruf
  state_member(State,RestStates).

/*eval_state(State,Value) :-
  goal_description(Goal),
  subtract(Goal,State,DiffState),
  length(DiffState,Value).
*/
eval_state(State,Value) :-
  goal_description(Goal),
  subtract(Goal,State,DiffState),
  subtract(Goal,DiffState,CorrectState),
  eval_correct(CorrectState,Value).

  
eval_correct(CorrectState,Value) :-
  findall((Y),eval_x(on(table,X),CorrectState,Y),TableResult),
  findall((YY),eval_x(on(Z,X),CorrectState,YY),OnResult),
  findall((YYY),eval_x(clear(X),CorrectState,YYY),ClearResult),
  length(TableResult, TableLength),
  length(OnResult, OnLength),
  length(ClearResult, ClearLength),
  Value is -1 * (TableLength + OnLength * 2 + ClearLength).
  
eval_x(Name, State, Name) :-
  member(Name, State).


eval_path([(_,State,Value)|_],default):-
  eval_state(State,Value).

eval_path([(_,State,Value)|RestPath],a):-
  eval_state(State,StateValue),
  length(RestPath,RestCost),
  %Value berechnen
  Value is StateValue + RestCost.

action(pick_up(X),
       [handempty, clear(X), on(table,X)],
       [handempty, clear(X), on(table,X)],
       [holding(X)]).

action(pick_up(X),
       [handempty, clear(X), on(Y,X), block(Y)],
       [handempty, clear(X), on(Y,X)],
       [holding(X), clear(Y)]).

action(put_on_table(X),
       [holding(X)],
       [holding(X)],
       [handempty, clear(X), on(table,X)]).

action(put_on(Y,X),
       [holding(X), clear(Y)],
       [holding(X), clear(Y)],
       [handempty, clear(X), on(Y,X)]).


% Hilfskonstrukt, weil das PROLOG "subset" nicht die Unifikation von Listenelementen 
% durchf�hrt, wenn Variablen enthalten sind. "member" unifiziert hingegen.
%
mysubset([],_).
mysubset([H|T],List):-
  member(H,List),
  mysubset(T,List).


expand_help(State,Name,NewState):-
  %Action suchen
  action(Name, ConditionList, DeleteList, AddList),
  %Conditions testen
  mysubset(ConditionList, State),
  %Del-List umsetzen
  subtract(State, DeleteList, TState),
  %Add-List umsetzen
  append(TState, AddList, NewState).
  
expand((_,State,_),Result):-
  findall((Name,NewState,_),expand_help(State,Name,NewState),Result).


























