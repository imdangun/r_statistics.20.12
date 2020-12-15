## 3. histogram, 으로
# - 모집단 분포의 형태 (shape)
# - 모집단 분포의 중심위치 (location)
# - 모집단 분포의 산포 (spread)

str(iris)

par(mfrow = c(2, 2)) 

for(k in 1:4) hist(iris[[k]]) 
# plot1

제목 = paste0('[', colnames(iris[1:4]), ']'); 제목
# [1] "[Sepal.Length]" "[Sepal.Width]"  "[Petal.Length]" "[Petal.Width]"

색상 = c('yellow', 'lightgreen', 'lightpink', 'skyblue')

for(k in 1:4) hist(iris[[k]], main = 제목[k], 
                   xlab = colnames(iris[k]), ylab = '도수', col = 색상[k])
# plot2

unstable.hist()
# plot3

unstable.hist(N = 100, m2 = 4, a = 11, b = 12, c = 8, vc = rainbow(4))
# plot4

ch2.man(2)
# [2] Making Histograms of Unstable Processes
# unstable.hist(N=200, m1=10, s1=1, m2=6, s2=0.5, a=8, b=9, c=9, vc=rep("cyan", 4))
# [Optional Input]--------------------------
#   N  	 Number of data for each histogram (default=200)
# m1 	 Mean the main distribution (default=10)
# s1 	 Standard deviation of the main distribution (default=1)
# m2 	 Mean of the contaminated distribution (default=6)
# s2 	 Standard deviation of the contaminated distribution (default=0.5)
# a  	 Lower limit of the missing values (default=8)
# b  	 Upper limit of the missing values (default=9)
# c  	 Lower limit of the cliff type range (default=9)
# vc 	 Color vector of histograms (default="cyan")


## stratified(층화) histogram
strat.hist()
# plot5

strat.hist(s = c(0.5, 1, 1.5))
# plot6

strat.hist(ng = 4, m = (2:5) * 3)
# plot7

ch2.man(3)
# [3] Making Stratified Histograms
# strat.hist(ng=3, n=200, m=c(6,10,14), s=1, sp=c(4, 16), vc, prob=FALSE)
# [Optional Input]--------------------------
#   ng 	 Number of groups (default=3)
# n  	 Number of data for each histogram (default=200)
# m  	 Vector of mean for each group (default=c(6,10,14))
# s  	 Vector of standard deviation or each group (default=1)
# sp 	 Specification limits (default=c(4, 16))
# vc 	 Color vector(1+ng) of histograms (default="orange"(total), "cyan"(sub))
# prob	 Logical value for selecting density instead of frequency (default=FALSE)