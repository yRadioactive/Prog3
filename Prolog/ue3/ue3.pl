% DCG-Regel
% Aufruf mit: ?- phrase(satz(X), Wortliste).
%! satz(-Satz)

%satz(X) --> np(S, nominativ,_), verb(V, transitiv), np(O, akkusativ,_), { X =.. [V, S, O] }.
satz(X) --> np(S, nominativ,_), vp(V, transitiv,AD), np(O, akkusativ,A), { X =.. [V, S,AD,A, O] }.
satz(X) --> np(S, nominativ,_), vp(V, intransitiv,AD), { X =.. [V,S,AD] }.

% DCG-Regel
% NP = Nominalphrase
%! np(-Substantiv, -Fall, -Adjektiv)

np(X, _, _) --> name(X).
np(X, F, _) --> artikel(G, F), subst(X, F, G).
np(X, F, A) --> artikel(G, F), adjektiv(A, G, F), subst(X, F, G).

% DCG-Regel
% VP = Verbphrase
%! vp(-Verb, -Valenz,-Adverb)
vp(V,VA,_) --> verb(V,VA).
vp(V,VA,[A|Rest]) -->  verb(V,VA),advs([A|Rest]).


advs([A|Rest]) --> adverb(A), advs(Rest).
advs([]) --> [].



% DCG-Regel
%! adverb(-Adverb)
adverb(nicht) --> [nicht].
adverb(heute) --> [heute].
adverb(gern) --> [gern].

% DCG-Regel
%! adjektiv(-Adjektiv, -Genus, -Fall)

adjektiv(erste, f,nominativ) --> [erste].
adjektiv(letzte, f,nominativ) --> [letzte].
adjektiv(erste, f,akkusativ) --> [erste].
adjektiv(letzte, f,akkusativ) --> [letzte].

adjektiv(erster, m,nominativ) --> [erster].
adjektiv(letzter, m,nominativ) --> [letzter].
adjektiv(erster, m,akkusativ) --> [ersten].
adjektiv(letzter, m, akkusativ) --> [letzten].

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
