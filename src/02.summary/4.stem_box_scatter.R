##4. stem-plot,  box plot, scatter diagram chart(산점도),

##1. stem-and-leaf plot (줄기-잎 그림)
# - stem: 마지막 한자리를 제외한 윗자리 숫자
# - leaf: 마지막 한자리 숫자

library(Rstat)

data(exa2_3)

x = exa2_3

str(x)
# 'data.frame':	10 obs. of  10 variables:
# $ V1 : num  4.91 4.79 4.77 5.01 4.91 4.87 4.94 5.02 4.66 4.79
# $ V2 : num  5.03 5.01 4.76 4.93 4.81 4.88 5.29 4.97 4.95 5.09
# $ V3 : num  5.07 4.77 5.11 5.01 4.99 4.87 4.97 5.07 5.19 4.98
# $ V4 : num  5.21 4.95 5.17 5.08 4.89 4.75 4.99 4.89 4.84 4.94
# $ V5 : num  4.74 4.59 4.94 4.69 4.79 4.99 4.95 4.77 4.93 5.17
# $ V6 : num  5.03 5.07 4.69 4.89 4.74 4.59 4.65 4.88 4.98 4.88
# $ V7 : num  5.08 4.97 5.01 5.23 5.09 5.07 4.77 5.08 5.08 4.96
# $ V8 : num  4.95 5.19 5.11 4.99 5.07 4.99 4.83 4.78 4.85 4.92
# $ V9 : num  4.89 5.05 4.75 5.14 5.25 4.99 4.95 5.23 5.04 4.79
# $ V10: num  4.65 5.27 5.05 4.95 5.28 5.07 5.05 5.18 4.89 5.1

x = as.matrix(x)

stem(x)
# 45 | 99
# 46 | 55699
# 47 | 44556777789999
# 48 | 13457788899999
# 49 | 11233444555555677788999999
# 50 | 11112334555777777888899
# 51 | 011477899
# 52 | 1335789


##2. box plot
# - median 과 quartile(사분위수)를 상자로 표시한다.
# - 상한 inner fence = Q3 + 1.5 * (Q3 - Q1)
# - 하한 inner fence = Q1 - 1.5 * (Q3 - Q1)

data(exa2_3)

x = matrix(as.matrix(exa2_3), ncol = 1)

win.graph(7, 4)

boxplot(x, horizontal = T, main = '상자그림', col = 'cyan')
# plot1

points(x, rep(1, 100))
# plot2
                      #     하한   Q1     Q2    Q3   상한
xfn = fivenum(x); xfn # [1] 4.590 4.860 4.965 5.070 5.290

text(xfn, 0.65, labels = xfn, pos = 3)
# plot3

legend('topright', paste0(c('평균', '표준편차', '표본개수'), '=',
                          round(c(mean(x), sd(x), length(x)), 4)), text.col = 4)
# plot4


#
data(exa2_3)
x = as.matrix(exa2_3)
win.graph(7, 5)

boxplot(x, main = '열별 상자그림', boxwex = 0.3, ylab = '저항', col = 7)
# plot11

grid(col = 3)
# plot12

points(rep(1:10, each = 10), x, pch = 19, cex = 0.8, col = 2)
# plot13

xstat = apply(x, 2, fivenum) # x의 column(2)별로 fivenum 을 적용한다.

text(rep(1:10, each = 5), xstat, labels = xstat, col = 4, cex = 0.7, pos = 4)
# plot14



##3. scatter diagram chart
# - 두 변수의 상관관계를 표현한다.
# - hypothesis test 의 예비 단계로 사용한다.

corr.plot6()
# plot31

corr.plot6(m1 = 50, s1 = 10, m2 = 65, s2 = 5, r = 0.8, r2 = 0.9, n = 100)
# plot32

ch2.man(4)
# [4] Making Scatter Plots of Six Cases
# corr.plot6(m1 = 60, s1=10, m2=60, s2=10, r=0.7, r2=0.8, n=50)
# [Optional Input]--------------------------
# m1 	 Mean of x (default= 60)
# s1   Standard deviation of x (default=10)
# m2 	 Mean of y (default=60)
# s2 	 Standard deviation of y (default=10)
# r    Correlation coefficient of x and y (default=0.7)
# r2   Correlation coefficient of the stratified sample (default=0.8)
# n    Number of data pairs (default=50)

plot(mtcars$wt, mtcars$mpg)
# plot33

scat.lm(mtcars$wt, mtcars$mpg);
# plot34

with(mtcars, scat.lm(wt, mpg, mt='자동차 중량 대 연비 산점도', xl='중량(wt)', yl='연비(mpg)'))
# plot35

ch2.man(5)
# [5] Making a Scatter Plot with a Regression Line
# scat.lm(x, y, mt, xl, yl, w=c(7, 5), ...)
# [Mandatory Input]--------------------------
# x  	 Data vector for x-axis
# y  	 Data vector for y-axis
# [Optional Input]--------------------------
# mt 	 Title of the scatter plot
# xl 	 Label of x-axis
# yl 	 Label of y-axis
# w  	 Size of the graphic window (default=c(7, 5))
# ...  	 Graphic parameters

# https://rfriend.tistory.com/83 : pairs()
pairs(mtcars[c(1, 2, 4, 6)])
# plot36

pairs(~mpg + cyl + hp + wt, data = mtcars)
# plot37

pairs(~mpg + cyl + hp + wt, data = mtcars, main = '자동차 특성치 산점행렬도', 
      panel = function(x, y) { points(x, y, pch = 19, col = 4) 
        abline(lm(y~x), col = 2)})
# plot38