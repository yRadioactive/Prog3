% DCG-Regel
% Aufruf mit: ?- phrase(satz(X), Wortliste).
%! satz(-Satz)

satz(X) --> np(S, nominativ,_), verb(V, transitiv), np(O, akkusativ,_), { X =.. [V, S, O] }.
satz(X) --> np(S, nominativ,_), verb(V, transitiv), np(O, akkusativ,A), { X =.. [A ,V, S, O] }.
satz(X) --> np(S, nominativ,_), verb(V, intransitiv), { X =.. [V, S] }.

% DCG-Regel
% NP = Nominalphrase
%! np(-Substantiv, -Fall, -Adjektiv)

np(X, _, _) --> name(X).
np(X, F, _) --> artikel(G, F), subst(X, F, G).
np(X, F, A) --> artikel(G, F), adjektiv(A, G), subst(X, F, G).


% DCG-Regel
%! adjektiv(-Adjektiv,  -Genus)

adjektiv(erste, f) --> [erste].
adjektiv(letzte, f) --> [letzte].

adjektiv(erster, m) --> [ersten].
adjektiv(letzter, m) --> [letzten].

% DCG-Regel
%! name(-Name)

name(vladimir) --> [vladimir].
name(estragon) --> [estragon].
name(godot) --> [godot].
name(lea) --> [lea].

% DCG-Regel
%! artikel(-Genus, -Fall)

artikel(m, nominativ) --> [der].
artikel(m, akkusativ) --> [den].

artikel(m, nominativ) --> [ein].
artikel(m, akkusativ) --> [einen].

artikel(f,nominativ) --> [die].
artikel(f,akkusativ) --> [die].

artikel(f, nominativ) --> [eine].
artikel(f, akkusativ) --> [eine].

% DCG-Regel
%! subst(-Substantiv, ?Fall, -Genus)

subst(keks, _, m) --> [keks].
subst(pizza,_, f) --> [pizza].

subst(pate, nominativ, m) --> [pate].
subst(pate, akkusativ, m) --> [paten].

% DCG-Regel
%! verb(-Verb, ?Valenz)

verb(warten, intransitiv) --> [wartet].
verb(warten, transitiv) --> [erwartet].
verb(essen, intransitiv) --> [isst].
verb(essen, transitiv) --> [isst].
verb(gehen, intransitiv) --> [geht].
