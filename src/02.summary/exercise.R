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