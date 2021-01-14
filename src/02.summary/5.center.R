# 2.5 중심위치 척도

data(exa2_3)
x = as.matrix(exa2_3)

location.est(x)
# Mean= 4.9568 	 Median= 4.965 	 Mode= 4.95 4.99 5.07 
# Geom. Mean= 4.954251 	 Harm. Mean= 4.951692 	 Trim. Mean(0.1)= 4.957625

location.est(x, detail = T)
# (1) Mean = 495.68/100 = 4.9568 
# (2) Median = x(50.5) = 4.965 
# (3) Mode = 4.95 4.99 5.07 (6times) 
# (4) Geom. Mean = 3.146297e+69^(1/100) = 4.954251 
# (5) Harm. Mean = 1/0.2019512 = 4.951692 
# (6) Trim. Mean(0.1) = 396.61/80 = 4.957625