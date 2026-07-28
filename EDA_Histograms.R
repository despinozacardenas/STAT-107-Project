par(mfrow = c(4, 4), mar = c(2.5, 2.5, 2, 1))

for (var_name in names(my_data[names(my_data) != "gender"])) {
  my_measurement <- as.numeric(my_data[[var_name]])
  vals   <- as.numeric(group_males[[var_name]])
  hist(vals,
       main = paste("Distribution:", var_name),
       xlab = "",
       ylab = "Counts",
       col  = "lightblue", 
       border = "white")
  abline(v = my_measurement, col = "red", lwd = 2, lty = 2)
}

par(mfrow = c(1, 1))