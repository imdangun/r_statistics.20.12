library(Rstat)

#1.
S1 = rolldie2(3); S1
(N = nrow(S1))

S2 = subset(S1, X1<=X2 & X2<=X3); S2
nrow(S2)

A = subset(S1, apply(S1, 1, sum) >= 15); element(A)
nrow(A)
pprt(A, N)


#R1.
S1 = rolldie2(4)
(N = nrow(S1))

S2 = subset(S1, X1<=X2 & X2<=X3 & X3<=X4); S2
nrow(S2)

A = subset(S1, apply(S1, 1, sum) >= 20); A
nrow(A)
pprt(A, N)

B = subset(S1, apply(S1, 1, sum) >= 8 & apply(S1, 1, sum) <= 20); B
nrow(B)
pprt(B, N)


##2.
S = tosscoin2(4)
countH = function(x) sum(x == 'H')
countT = function(x) sum(x == 'T')

A = subset(S, apply(S, 1, countH) >= 2)
B = subset(S, apply(S, 1, countH) > apply(S, 1, countT))
C = subset(S, apply(S, 1, countT) >= 1)


## ven diagram
install.packages('tidyverse')
install.packages('ggforce')
install.packages('ggplot2')

library(tidyverse)
library(ggforce)
library(ggplot2)

.libPaths()
installed.packages()

install.packages('ggplot2', dependencies = T)
