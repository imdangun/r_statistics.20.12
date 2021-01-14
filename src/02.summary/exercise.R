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
