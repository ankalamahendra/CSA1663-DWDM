# Install and load necessary libraries
if(!require(tidyverse)) install.packages("tidyverse")
if(!require(caret)) install.packages("caret")
if(!require(broom)) install.packages("broom")
library(tidyverse)
library(caret)
library(broom)

# Create the synthetic dataset
set.seed(123)  # For reproducibility
n <- 200  # Number of observations

Age <- sample(20:70, n, replace = TRUE)
BMI <- round(rnorm(n, mean = 30, sd = 5), 1)
Glucose <- round(rnorm(n, mean = 120, sd = 30), 1)
BloodPressure <- round(rnorm(n, mean = 70, sd = 10), 1)
Insulin <- round(rnorm(n, mean = 80, sd = 15), 1)
Outcome <- sample(0:1, n, replace = TRUE)

diabetes_data <- data.frame(Age, BMI, Glucose, BloodPressure, Insulin, Outcome)

# Display the first few rows of the dataset
head(diabetes_data)

# Simple Linear Regression: Predict diabetes outcome based on age
linear_model <- lm(Outcome ~ Age, data = diabetes_data)

# Summary of the linear regression model
summary(linear_model)

# Visualize the linear regression model
ggplot(diabetes_data, aes(x = Age, y = Outcome)) +
  geom_point() +
  geom_smooth(method = "lm", col = "blue") +
  labs(title = "Linear Regression: Diabetes Outcome vs Age",
       x = "Age",
       y = "Diabetes Outcome")

# Multiple Regression: Predict diabetes outcome based on age and other factors
multiple_model <- lm(Outcome ~ Age + BMI + Glucose + BloodPressure + Insulin, data = diabetes_data)

# Summary of the multiple regression model
summary(multiple_model)

# Display the model coefficients
tidy(multiple_model)

# Check for multicollinearity using Variance Inflation Factor (VIF)
vif_model <- vif(multiple_model)
vif_model
