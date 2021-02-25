library(Rstat)

#1.
S1 = rolldie2(3)
(N = nrow(S1))

S2 = subset(S1, X1<=X2 & X2<=X3); nrow(S2)

A = subset(S1, apply(S1, 1, sum) >= 15)
nrow(A)
element(A)
pprt(A, N)

#2.
