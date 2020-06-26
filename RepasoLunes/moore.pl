mueve(q0,a,q2).
mueve(q0,b,q1).
mueve(q1,b,q3).
mueve(q1,a,q0).
mueve(q2,a,q2).
mueve(q2,b,q3).
mueve(q3,b,q3).
mueve(q3,a,q0).

transita(X,[],X):-!.
transita(Qi,[A|B],Qf):-mueve(Qi,A,P),transita(P,B,Qf),!.
acepta(X):-transita(q0,X,Qi),Qi=q1.
%En este caso se sigue el diagrama.
