# Load the dataset
water_data <- read.csv("water.csv")

# Display the structure of the dataset
str(water_data)

# Create a scatter plot
plot(water_data$hardness, water_data$mortality,
     xlab = "Hardness", ylab = "Mortality",
     main = "Scatter Plot of Mortality vs. Hardness")

# Fit a linear regression model
linear_model <- lm(mortality ~ hardness, data = water_data)

# Display the model summary
summary(linear_model)
# Predict mortality for hardness = 88
new_data <- data.frame(hardness = 88)
predicted_mortality <- predict(linear_model, newdata = new_data)
cat("Predicted Mortality for Hardness = 88:", predicted_mortality)
