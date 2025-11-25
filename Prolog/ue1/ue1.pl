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

onkel(X,Y) :- maennlich(Y),vater(X,V), bruder(V,Y).

tante(X,Y) :- weiblich(Y), mutter(X,M), schwester(M,Y).

nichte(X,Y) :- weiblich(Y), mutter(Y,M), schwester(X,M).

schwaegerin(X,Y) :- ehefrau(X,G),schwester(G,Y).

schwester(X, Y) :- weiblich(Y),
		   mutter(X, M), mutter(Y, M),
		   vater(X, V), vater(Y, V),
		   X \== Y.