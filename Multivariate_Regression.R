multivariate_model <- lm(
  weight ~ shoulder_girth + chest_girth + waist_girth + 
    navel_girth + hip_girth + thigh_girth + 
    bicep_girth + forearm_girth + knee_girth + 
    calf_girth + ankle_girth + wrist_girth, 
  data = group_males
)

print(summary(multivariate_model))

my_predicted_weight <- predict(multivariate_model, newdata = my_row)
my_actual_weight    <- my_row$weight
my_residual         <- my_actual_weight - my_predicted_weight

multivariate_plot <- ggplot(data = multivariate_model, aes(x = .fitted, y = weight)) +
  geom_point(alpha = 0.5) +
  geom_abline(slope = 1, intercept = 0, color = "red", lty = 2) +
  geom_point(data = tibble(x = my_predicted_weight, y = my_actual_weight),
             aes(x = x, y = y),
             color = "blue", size = 4, shape = 20) +
  labs(
    title = "Multivariate Model: Actual vs. Predicted Weight",
    subtitle = "Blue data point represents my individual standing",
    x = "Predicted Weight (kg) based on 12 Girths",
    y = "Actual Weight (kg)"
  ) +
  theme_minimal()

residual_plot <- ggplot(data = multivariate_model, aes(x = .fitted, y = .resid)) +
  geom_point(alpha = 0.5) +
  geom_hline(yintercept = 0, linetype = "dashed") +
  geom_smooth(se = FALSE, color = "red") +
  geom_point(data = tibble(x = my_predicted_weight, y = my_residual),
             aes(x = x, y = y),
             color = "blue", size = 4, shape = 20) +
  labs(
    title = "Residual Plot for Multivariate Weight Model",
    subtitle = "Blue data point represents my individual model residual (Error)",
    x = "Fitted Values (Predicted Weight)",
    y = "Residuals (Actual - Predicted)"
  ) +
  theme_minimal()


print(multivariate_plot)
print(residual_plot)