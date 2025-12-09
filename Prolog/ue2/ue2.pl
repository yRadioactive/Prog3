stueckpreis(N,P) :- N =< 1000, !, P=15.
stueckpreis(N,P) :- N =< 10000,!, P=12.
stueckpreis(N,P) :- N > 10000, P=10.

pythagoras(A,B,C) :- number(A),number(B),number(C),!,A*A+B*B=:=C*C .
pythagoras(A,B,C) :- number(A),number(B),var(C),!, C is sqrt(A*A+B*B).
pythagoras(A,B,C) :- number(A),var(B),number(B),!, B is sqrt(C*C-A*A).
pythagoras(A,B,C) :- var(A),number(B),number(C), A is sqrt(C*C-B*B) .