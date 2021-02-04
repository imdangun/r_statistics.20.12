# 연습문제

# 1.
x = c(28, 29, 
      30 + c(0, 2, 3, 5, 8), 
      40 + c(0, 1, 2, 3, 3, 4, 5, 6, 6, 9),
      50 + c(0, 0, 1, 2, 2, 2, 3, 5, 5, 6, 6, 6, 7, 7, 8, 9),
      60 + c(1, 1, 2, 3, 4, 5, 5, 5, 7, 8),
      70 + c(2, 4, 5, 6, 7),
      80 + c(1, 2, 2))

mean(x) # [1] 54.76471

sd(x) # [1] 14.24582

median(x) # [1] 55

quantile(x, c(0.25, 0.75))
#  25%  75% 
# 44.5 64.5 

win.graph(9, 4)
par(mfrow = c(1, 2))

boxplot(x, main = 'boxplot', horizontal = T, col = 7)
points(x, rep(1, length(x)))

xfn = fivenum(x); xfn # [1] 28.0 44.5 55.0 64.5 82.0
text(xfn, 0.65, labels = xfn, pos = 3, cex = 0.8, col = 4)        

text(55, 1.4, labels = paste0('평균 = ', round(mean(x), 3), 
                              '\n표준편차 = ', round(sd(x), 3),
                              '\n표본개수 = ', length(x)), cex = 0.8, col = 4)

hist(x, main='histogram', col = 7, prob = T)
lines(density(x), lwd = 1.5, col = 2)
abline(v = mean(x), lty = 2, lwd = 2, col = 4)
# p1


# 2.
data(ex2_2)
x = as.matrix(ex2_2)

# 1)
freq.table(x)
#              Center Freq Cum-Fr Rel-Fr Rel-CFr
# (24.2, 24.4]   24.3    7      7   0.07    0.07
# (24.4, 24.6]   24.5   15     22   0.15    0.22
# (24.6, 24.8]   24.7   16     38   0.16    0.38
# (24.8, 25]     24.9   28     66   0.28    0.66
# (25, 25.2]     25.1   21     87   0.21    0.87
# (25.2, 25.4]   25.3    7     94   0.07    0.94
# (25.4, 25.6]   25.5    6    100   0.06    1.00

# 2)
stem(x)
# The decimal point is 1 digit(s) to the left of the |
# 242 | 00000
# 244 | 00000000000
# 246 | 00000000000
# 248 | 00000000000000000000000000
# 250 | 0000000000000000000000000
# 252 | 000000000000
# 254 | 00000000
# 256 | 00

# 3)
win.graph(7, 4)
hist(x, prob = T, col = 7)
lines(density(x), col = 2)
abline(v = mean(x), lty = 2, lwd = 2, col = 4)
mtext(round(mean(x), 3), side = 3, at = mean(x), col = 4, cex = 0.9)
# p2-3

# 4)
mean(x); var(as.vector(x)); median(x)
# [1] 24.917
# [1] 0.1024354
# [1] 24.9

# 5)
lsl = 25 - 0.5; usl = 25 + 0.5
nd1 = sum(x < lsl); nd2 = sum(x > usl)
pd1 = nd1 / length(x); pd2 = nd2 / length(x)
cat('P(x < lsl) = ', pd1, '\tP(x > usl) = ', pd2, '\tP(d) = ', pd1 + pd2, '\n')
# P(x < lsl) =  0.07 	P(x > usl) =  0.02 	P(d) =  0.09

# 6)
abline(v = c(lsl, usl), col = 2, lwd = 2)
text(c(lsl, usl), 1.3, labels = c(pd1, pd2), col = 2, pos = c(2, 4))
# p2-6


# 3.
# 1)
data(ex2_3); xd = ex2_3; str(xd)

x = as.matrix(xd[, -1])

freq.table(x)
#           Center Freq Cum-Fr Rel-Fr Rel-CFr
# (10, 20]      15    5      5 0.0625  0.0625
# (20, 30]      25    6     11 0.0750  0.1375
# (30, 40]      35    8     19 0.1000  0.2375
# (40, 50]      45    8     27 0.1000  0.3375
# (50, 60]      55    8     35 0.1000  0.4375
# (60, 70]      65   13     48 0.1625  0.6000
# (70, 80]      75   13     61 0.1625  0.7625
# (80, 90]      85   13     74 0.1625  0.9250
# (90, 100]     95    6     80 0.0750  1.0000

# 2)
stem(x)
# 1 | 01124
# 2 | 124578
# 3 | 11344466
# 4 | 11335799
# 5 | 122446
# 6 | 0022244666688
# 7 | 002555557777999
# 8 | 122224467799
# 9 | 0444567

# 3)
hist(x, main = '전체성적', col = 7, prob = T)
lines(density(x), col = 2)
abline(v = mean(x), lty = 2, col = 4, lwd = 2)
mtext(round(mean(x), 3), side = 3, at = mean(x), col = 4, cex = 0.9)
# p3-3

# 4)
mean(x) # [1] 59.9
var(as.vector(x)) # [1] 592.0405
median(x) # [1] 65

# 5)
x1 = as.matrix(xd[xd[1] == '남자', ][-1])
x2 = as.matrix(xd[xd[1] == '여자', ][-1])

freq.table(x1)
#           Center Freq Cum-Fr Rel-Fr Rel-CFr
# (10, 20]      15    4      4  0.100   0.100
# (20, 30]      25    3      7  0.075   0.175
# (30, 40]      35    4     11  0.100   0.275
# (40, 50]      45    2     13  0.050   0.325
# (50, 60]      55    3     16  0.075   0.400
# (60, 70]      65    7     23  0.175   0.575
# (70, 80]      75    6     29  0.150   0.725
# (80, 90]      85    8     37  0.200   0.925
# (90, 100]     95    3     40  0.075   1.00   

freq.table(x2)
#            enter Freq Cum-Fr Rel-Fr Rel-CFr
# (10, 20]      15    1      1  0.025   0.025
# (20, 30]      25    3      4  0.075   0.100
# (30, 40]      35    4      8  0.100   0.200
# (40, 50]      45    6     14  0.150   0.350
# (50, 60]      55    5     19  0.125   0.475
# (60, 70]      65    6     25  0.150   0.625
# (70, 80]      75    7     32  0.175   0.800
# (80, 90]      85    5     37  0.125   0.925
# (90, 100]     95    3     40  0.075   1.000

# 6)
stem(x1)
# 1 | 0114
# 2 | 127
# 3 | 1134
# 4 | 13
# 5 | 4
# 6 | 00224668
# 7 | 0255577
# 8 | 12446799
# 9 | 446

stem(x2)
# 1 | 2
# 2 | 458
# 3 | 4466
# 4 | 135799
# 5 | 12246
# 6 | 24668
# 7 | 05577999
# 8 | 2227
# 9 | 0457


# 7)
par(mfrow = c(2, 1))
par(mar = c(3, 4, 4, 2))
hist(x1, main='남자 성적', col = 'cyan', prob = T)
lines(density(x1), col = 2)
abline(v = mean(x1), lty = 2, col = 4, lwd = 2)
mtext(round(mean(x1), 3), side = 3, at = mean(x1), col = 4, cex = 0.9)

hist(x2, main='여자 성적', col='pink', prob=T, ylab=NA)
lines(density(x2), col=2)
abline(v=mean(x2), lty=2, col=4, lwd=2)
mtext(round(mean(x2), 3), side=3, at=mean(x2), col=4, cex=0.9)
# p3-7


# 8)
cat('mean(x1) =', mean(x1), '  var(x1) =', var(as.vector(x1)), 
    '  median(x1) =', median(x1), '\n')
# mean(x1) = 59.45   var(x1) = 709.2795   median = 66

cat('mean(x2) =', mean(x2), '  var(x2) =', var(as.vector(x2)), 
    '  median(x1) =', median(x2), '\n')
# mean(x2) = 60.35   var(x2) = 489.5667   median(x1) = 63 


# 9)
sex = as.factor(c(rep('남자', 40), rep('여자', 40))); sex
x12 = c(as.vector(x1), as.vector(x2)); x12
xrank = round(rank(-x12), 0); xrank
tapply(xrank, sex, mean)
#   남자   여자 
# 40.400 40.375


# 10)
table(sex[xrank <= 9])
# 남자 여자 
#   5    4


# 11)
min(x12[xrank <= 9])
# [1] 89


# 12)
tapply(x12[xrank <= 9], sex[xrank <= 9], mean)
# 남자 여자 
# 92.4 94.0 


# 13)
tapply(x12[x12 >= 85], sex[x12 >= 85], length)
# 남자 여자 
#    7    5


# 14)
round(tapply(x12[x12 >= 85], sex[x12 >= 85], mean), 1)
# 남자 여자 
# 90.7 92.6


# 15)
xrank1 = rank(-x1); xrank2 = rank(-x2)
min(x1[xrank1 <= 5]) # [1] 89
min(x2[xrank2 <= 5]) # [1] 87


# R1)
boxplot(x12, main='전체성적', horizontal=T, col=7)
text(fivenum(x12), 0.7, labels=fivenum(x12), col=4)
# p-R1


# R2)
win.graph(7, 5)
par(mfrow=c(2, 1))
par(mar=c(3, 2, 3, 2))

boxplot(as.vector(x1), main='남자성적', horizontal=T, col='cyan')
text(fivenum(x1), 0.5, labels=fivenum(x1), pos=3, cex=1, col=4)

boxplot(as.vector(x2), main='여자성적', horizontal=T, col='pink')
text(fivenum(x2), 0.5, labels=fivenum(x2), pos=3, cex=1, col=4)
# p-R2


# R1.
data(exa2_2)

str(exa2_2)
# 'data.frame':	210 obs. of  4 variables:
# $ 성별    : Factor w/ 2 levels "남","여": 2 1 2 2 2 2 1 1 2 2 ...
# $ 입학전형: Factor w/ 4 levels "논술우수","정시일반",..: 4 4 4 3 3 4 4 4 3 3 ...
# $ 참여활동: Factor w/ 5 levels "교과활동","동아리",..: 4 1 4 1 1 5 5 2 4 4 ...
# $ GPA     : num  2.5 4.2 3 4.1 3.3 3.5 3.3 3.4 2.6 3.2 ...

x = exa2_2$GPA


# 1)
stem(x)
# The decimal point is 1 digit(s) to the left of the |
#  8 | 0
# 10 | 
# 12 | 0
# 14 | 000
# 16 | 00
# 18 | 0
# 20 | 
# 22 | 00
# 24 | 000000
# 26 | 0000000000000
# 28 | 0000000000
# 30 | 0000000000000000000
# 32 | 00000000000000000000000000000
# 34 | 00000000000000000000000000000000000
# 36 | 000000000000000000000000
# 38 | 000000000000000000000000
# 40 | 0000000000000000000
# 42 | 000000000000000000
# 44 | 000


# 2)
r1 = min(x); r1 # [1] 0.8
r2 = max(x); r2 # [1] 4.5
xbr = seq(r1 - 0.05, r2 + 0.05, length=20); xbr
#  [1] 0.75 0.95 1.15 1.35 1.55 1.75 1.95 2.15 2.35 2.55 2.75 2.95 3.15 3.35 3.55 3.75 3.95
# [18] 4.15 4.35 4.55

xh = hist(x, breaks=xbr, plot=F); xh
hist(x, breaks=xbr, col=7, ylim=c(0, max(xh$counts) * 1.05), main='신입생 성적')
with(xh, text(mids, counts, counts, col=4, pos=3))
# p r1-2


# 3)
cat('mean(x)=', mean(x), 'var(x)=', var(as.vector(x)), 'median(x)=', median(x), '\n')
# mean(x)= 3.402381 var(x)= 0.3959273 median(x)= 3.5


# 4)
levels(exa2_2$입학전형)
# [1] "논술우수"   "정시일반"   "학생부교과" "학생부종합"

recruitType = ifelse(exa2_2$입학전형=='정시일반', '정시', '수시')
recruitType = as.factor(recruitType)
tab1 = table(exa2_2$성별, recruitType)
addmargins(tab1)
#     recruitType
#     수시 정시 Sum
# 남    40   32  72
# 여    83   55 138
# Sum  123   87 210

addmargins(prop.table(tab1))
#     recruitType
#          수시      정시       Sum
# 남  0.1904762 0.1523810 0.3428571
# 여  0.3952381 0.2619048 0.6571429
# Sum 0.5857143 0.4142857 1.0000000
                          
addmargins(prop.table(tab1, 1), 2)
# recruitType
#         수시      정시       Sum
# 남 0.5555556 0.4444444 1.0000000
# 여 0.6014493 0.3985507 1.0000000


# 5)
x1 = x[exa2_2$성별 == '남']
x2 = x[exa2_2$성별 == '여']

par(mfrow=c(2, 1), mar=c(3, 3, 3, 1))

xh1 = hist(x1, breaks=xbr, plot=F)
hist(x1, breaks=xbr, col='cyan', ylim=c(0, max(xh1$counts) * 1.05), main='남자')
with(xh1, text(mids, counts, counts, col=4, pos=3))
abline(v=mean(x1), lty=2, lwd=2, col=2)
mtext(round(mean(x1), 2), side=1, at=mean(x1), col=2)

xh2 = hist(x2, breaks=xbr, plot=F)
hist(x2, breaks=xbr, col='pink', ylim=c(0, max(xh2$counts) * 1.05), main='여자')
with(xh2, text(mids, counts, counts, col=4, pos=3))
abline(v=mean(x2), lty=2, lwd=2, col=2)
mtext(round(mean(x2), 2), side=1, at=mean(x2), col=2)
# pr1-5


# 6)
cat('mean(x1)=', mean(x1), ' var(x1)=', var(x1), ' median(x1)=', median(x1), '\n')
# mean(x1)= 3.180556  var(x1)= 0.5308842  median(x1)= 3.3

cat('mean(x2)=', mean(x2), ' var(x2)=', var(x2), ' median(x2)=', median(x2))
# mean(x2)= 3.518116  var(x2)= 0.2895234  median(x2)= 3.5


# 7)
# 여학생이 우수하다.


# 8)
x1 = x[recruitType == '수시']
x2 = x[recruitType == '정시']

par(mfrow=c(2, 1), mar=c(4, 4, 4, 4))

xh1 = hist(x1, breaks=xbr, plot=F)
hist(x1, breaks=xbr, col='cyan', ylim=c(0, max(xh1$counts) * 1.05), main='수시')
with(xh1, text(mids, counts, counts, col=4, pos=3))
abline(v=mean(x1), lty=2, lwd=2, col=2)
mtext(round(mean(x1), 2), side=1, at=mean(x1), col=2)

xh2 = hist(x2, breaks=xbr, plot=F)
hist(x2, breaks=xbr, col='pink', ylim=c(0, max(xh2$counts) * 1.05), main='정시')
with(xh2, text(mids, counts, counts, col=4, pos=3))
abline(v=mean(x2), lty=2, lwd=2, col=2)
mtext(round(mean(x2), 2), side=1, at=mean(x2), col=2)
# p r1-8


# 9)
cat('mean(x1)=', mean(x1), ' var(x1)=', var(x1), ' median(x1)=', median(x1))
# mean(x1)= 3.414634  var(x1)= 0.4019152  median(x1)= 3.5

cat('mean(x)=', mean(x2), ' var(x2)=', var(x2), ' median(x2)=', median(x2))
# mean(x1)= 3.414634  var(x1)= 0.4019152  median(x1)= 3.5


# 10)
# 별 차이가 없다.


# 11)
tapply(x, list(exa2_2$성별, recruitType), mean)
#        수시     정시
# 남 3.280000 3.056250
# 여 3.479518 3.576364

tapply(x, list(exa2_2$성별, recruitType), var)
#         수시      정시
# 남 0.5980513 0.4347984
# 여 0.3004290 0.2725791

tapply(x, list(exa2_2$성별, recruitType), median)
#    수시 정시
# 남  3.4  3.1
# 여  3.5  3.6


# 12)
par(mfrow=c(2, 1))
boxplot(x, main='전체성적', horizontal=T, col=7)
text(fivenum(x), 0.7, labels=fivenum(x), col=4)
# p r1-12

summary(x)
#  Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
# 0.800   3.100   3.500   3.402   3.900   4.500

x[x < 1.9]
# [1] 1.3 1.5 1.6 0.8 1.6 1.5 1.5


# 13)
par(mfrow=c(1, 1))
with(exa2_2, boxplot(x~성별, main='성별 신입생 성적', horizontal=T, 
                     boxwex=0.5, col=c('cyan', 'pink')))

fn1 = fivenum(x[exa2_2$성별 == '남'])
text(fn1, 0.65, labels=fn1, col=4)

fn2 = fivenum(x[exa2_2$성별 == '여'])
text(fn2, 1.65, labels=fn2, col=4)
# p r1-13


# 14)
boxplot(x~recruitType, main='모집시기별 신입생 성적', horizontal=T,
        boxwex=0.5, col=c('cyan', 'pink'))

fn1 = fivenum(x[recruitType == '수시'])
text(fn1, 0.65, labels=fn1, col=4)

fn2 = fivenum(x[recruitType == '정시'])
text(fn2, 1.65, labels=fn2, col=4)
# p r1-14


# 15)
with(exa2_2, boxplot(x ~ 성별+모집시기, main='성별 모집시기별 신입생 성적'))

fn1 = fivenum(x[exa2_2$성별 == '남' & 모집시기 == '수시'])
fn2 = fivenum(x[exa2_2$성별 == '여' & 모집시기 == '수시'])
fn3 = fivenum(x[exa2_2$성별 == '남' & 모집시기 == '정시'])
fn4 = fivenum(x[exa2_2$성별 == '여' & 모집시기 == '정시'])

text(0.5, fn1, labels=fn1, col=4, cex=0.7)
text(1.5, fn2, labels=fn2, col=4, cex=0.7)
text(2.5, fn3, labels=fn3, col=4, cex=0.7)
text(3.5, fn4, labels=fn4, col=4, cex=0.7)
