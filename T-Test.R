weight_test <- t.test(group_males$weight, 
                      mu = 58.35, 
                      alternative = "greater", 
                      conf.level = 0.95)
print(weight_test)

male_sd <- sd(group_males$weight)
my_z_score <- (58.35 - 77.37) / male_sd
my_percentage <- round(pnorm(my_z_score) * 100 , 2)