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
