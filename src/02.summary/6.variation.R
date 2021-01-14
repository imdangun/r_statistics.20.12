# 2.6 variation(산포) 척도

data(exa2_3)
x = as.matrix(exa2_3)

spread.est(x)
# Variance= 0.0254341 	 Stand. Dev.= 0.1594807 
# Range= 0.7 	 IQR= 0.205 	 CoV= 0.03217413

spread.est(x, detail = T)
# (1) Variance = 2459.5046 - 495.68^2 / 100 = 0.0254341 
# (2) Stand. Dev. = sqrt(0.0254341) = 0.1594807 
# (3) Range = 5.29 - 4.59 = 0.7 
# (4) IQR = 5.07 - 4.865 = 0.205 
# (5) CoV = 0.1594807 / 4.9568 = 0.03217413