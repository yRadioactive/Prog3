%% Aufgaben zum 10. Foliensatz
%% Alternative Programmierparadigmen 2025
%% Prof. Baltasar Trancón Widemann

vater(richard, henry).
vater(joan, henry).
vater(john, henry).
vater(henry, geoffrey).
vater(hamelin, geoffrey).
vater(eleanor, william).
vater(anna, william).

mutter(richard, eleanor).
mutter(joan, eleanor).
mutter(john, eleanor).
mutter(henry, matilda).
mutter(hamelin, matilda).
mutter(eleanor, aenor).
mutter(anna, aenor).

ehefrau(henry, eleanor).
ehefrau(geoffrey, matilda).
ehefrau(william, aenor).

weiblich(joan).
weiblich(eleanor).
weiblich(matilda).
weiblich(aenor).
weiblich(anna).

maennlich(richard).
maennlich(john).
maennlich(henry).
maennlich(geoffrey).
maennlich(hamelin).

bruder(X,Y) :- maennlich(Y), mutter(X, M), mutter(Y, M),
		   vater(X, V), vater(Y, V), X \== Y.

onkel(X,Y) :- maennlich(Y),(mutter(X, Z) ; vater(X, Z)), bruder(V,Y).

tante(X,Y) :- weiblich(Y), (mutter(X,M) ; vater(X,M)), schwester(M,Y).

nichte(X,Y) :- weiblich(Y), mutter(Y,M), schwester(X,M).
nichte(X, Y) :- weiblich(Y), bruder(X, B), vater(Y, B).

schwaegerin(X, Y) :- ehefrau(X, Z), schwester(Z, Y).
schwaegerin(X, Y) :- ehefrau(Z, X), schwester(Z, Y).
schwaegerin(X, Y) :- ehefrau(X, B), ehefrau(B, Y).

schwester(X, Y) :- weiblich(Y),
		   mutter(X, M), mutter(Y, M),
		   vater(X, V), vater(Y, V),
		   X \== Y.