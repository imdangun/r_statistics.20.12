#2.1 frequency table (도수분포표)

# Rstat.zip 압축을 푼다.
# C:\DEV\R\R-3.4.4\library\Rstat 폴더를 붙여 넣는다.
.libPaths('C:/DEV/R/R-3.4.4/library')
.libPaths() # [1] "C:/DEV/R/R-3.4.4/library"

# 위 위치에 Rstat 폴더를 붙여 넣는다.

library(Rstat)

ch2.man()
 

## 2-1
data(iris)

str(iris)
'data.frame':	150 obs. of  5 variables:
# $ Sepal.Length: num  5.1 4.9 4.7 4.6 5 5.4 4.6 5 4.4 4.9 ...
# $ Sepal.Width : num  3.5 3 3.2 3.1 3.6 3.9 3.4 3.4 2.9 3.1 ...
# $ Petal.Length: num  1.4 1.4 1.3 1.5 1.4 1.7 1.4 1.5 1.4 1.5 ...
# $ Petal.Width : num  0.2 0.2 0.2 0.2 0.2 0.4 0.3 0.2 0.2 0.1 ...
# $ Species     : Factor w/ 3 levels "setosa","versicolor",..: 1 1 1 1 1 1 1 1 1 1 ...
  
x = iris[[2]]  

freq.table(x)
#            Center Freq Cum-Fr Rel-Fr Rel-CFr
# (2, 2.2]      2.1    4      4 0.0267  0.0267
# (2.2, 2.4]    2.3    7     11 0.0467  0.0733 # 2.2 초과 2.4 이하
# (2.4, 2.6]    2.5   13     24 0.0867  0.1600
# (2.6, 2.8]    2.7   23     47 0.1533  0.3133
# (2.8, 3]      2.9   36     83 0.2400  0.5533
# (3, 3.2]      3.1   24    107 0.1600  0.7133
# (3.2, 3.4]    3.3   18    125 0.1200  0.8333
# (3.4, 3.6]    3.5   10    135 0.0667  0.9000
# (3.6, 3.8]    3.7    9    144 0.0600  0.9600
# (3.8, 4]      3.9    3    147 0.0200  0.9800
# (4, 4.2]      4.1    2    149 0.0133  0.9933
# (4.2, 4.4]    4.3    1    150 0.0067  1.0000

ch2.man(1)
# [1] Making a Frequency Table
# freq.table(x, cuts, dig=4, mp=FALSE, ...)
# [Mandatory Input]--------------------------
#   x  	 Data vector
# [Optional Input]--------------------------
#   cuts	 Vector of class limits (default=built-in values)
# dig 	 Number of digits below decimal point (default=4)
# mp 	 Plot histogram? (default=FALSE)
# ...   	 Graphic parameter (default=built-in values)

freq.table(x, mp = T, col = 7) # plot1

(mycut = seq(2, 4.5, by = 0.5)) # [1] 2.0 2.5 3.0 3.5 4.0 4.5

freq.table(x, cuts = mycut)
#          Center Freq Cum-Fr Rel-Fr Rel-CFr
# (2, 2.5]   2.25   19     19 0.1267  0.1267
# (2.5, 3]   2.75   64     83 0.4267  0.5533
# (3, 3.5]   3.25   48    131 0.3200  0.8733
# (3.5, 4]   3.75   16    147 0.1067  0.9800
# (4, 4.5]   4.25    3    150 0.0200  1.0000