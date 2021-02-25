library(Rstat)

## 3-1
S = rolldie2(2); S
nrow(S)

S2 = subset(S, X1 <= X2); S2
nrow(s2)


S2 = S2[order(S2$X1, S2$X2),]; S2

A = subset(S2, (X1 + X2) %% 2 == 0);element(A);

B = subset(S2, (X1 + X2) >= 8); element(B);

library()

C = subset(S2, abs(X1 - X2) <= 1); element(C);           

AB = intersect2(A, B); element(AB);

AC = intersect2(A, C); element(AC);

BC = intersect2(B, C); element(BC);

ABC = intersect2(A, BC); element(ABC);

Bc = setdiff2(S2, B); element(Bc);

ABc = intersect2(A, Bc); element(ABc);

Bc = setdiff2(S2, B); element(Bc);

ABc = intersect2(A, Bc); element(ABc);


## 3-3
Ae = element(A, 12)
Be = element(B, 12)
Ce = element(C, 12)

# 작동 안된다.


## 3-4
A = subset(S2, abs(X1 -X2) >= 3)
Ae = element(A)

B = subset(S2, X1 * X2 >= 20)
Be = element(B)

intersect2(Ae, Be)


## 3-5
install.packages('animation')
library(animation)

ani.options(nmax=500, interval=0.01)

lln.ani(FUN=function(n, mu) rbinom(n, size=1, prob=mu), mu=0.5, type='n', col.poly='blue')
# plot

title(main='Law of Large Numbers')
grid()

S = tosscoin2(4); S
S = S[order(S$X1, S$X2, S$X3, S$X4),]
element(S, 8)

counth = function(x) sum(x == 'H')
A = subset(S, apply(S, 1, counth) >= 2); element(A, 6)

pprt(A, nrow(S))


##3-7
S = rolldie2(4); element(S)
N = nrow(S)

A = subset(S, X1 + X2 + X3 + X4 >= 15); pprt(A, N)

B = subset(S, apply(S, 1, max) == 6); pprt(B, N)

C = subset(S, apply(S, 1, min) == 1); pprt(C, N)

AB = intersect2(A, B)
AC = intersect2(A, C)
BC = intersect2(B, C)
ABC = intersect2(AB, C)

pprt(AB, N); pprt(AC, N); pprt(BC, N); pprt(ABC, N)


##3-8
AuB = union2(A, B)
AuC = union2(A, C)
BuC = union2(B, C)
AuBuC = union2(AuB, C)

pprt(AuB, N); pprt(AuC, N); pprt(BuC, N); pprt(AuBuC, N)


##3-9
all(diff(sort(c(4,3,2,1))) == 1)

is.stra = function(x) all(diff(sort(x)) == 1)
stra = subset(S, apply(S, 1, is.stra)); stra

nrow(stra)

pprt(stra, nrow(S))


##3-10
Bc = setdiff2(S, B)
Ac = setdiff2(S, A)
Cc = setdiff2(S, C)

ABc = intersect2(A, Bc); pprt(ABc, N)
AcBc = intersect2(Ac, Bc); pprt(AcBc, N)
ABCc = intersect2(AB, Cc); pprt(ABCc, N)
ABcC = intersect2(ABc, C); pprt(ABcC, N)


##3-11
##3-12
cprt(A, B)
cprt(A, C)
cprt(A, BC)
cprt(A, BuC)


#3-13
CD = rep(c('C', 'D', 'H', 'S'), each=13)
CD4 = urnsample2(CD, size=4); CD4
(N = nrow(CD4))

apply(CD4, 1, unique)

sameshape = function(x) length(unique(x)) == 1
Flush = subset(CD4, apply(CD4, 1, sameshape)); Flush

pprt(Flush, N)


##3-14
##3-15
##3-16
S=rolldie2(5); (N = nrow(S))

even = function(x) (sum(x) %% 2) == 0
span5 = function(x) (max(x) - min(x)) == 5

A = subset(S, apply(S, 1, even)); nrow(A)
B = subset(S, apply(S, 1, span5)); nrow(B)

indep.event(A, B, N)

prior = c(0.2, 0.4, 0.3, 0.1)
cond = c(4, 2, 1, 5) / 100
tot = prior* cond; tot
sum(tot)


## 3-18
