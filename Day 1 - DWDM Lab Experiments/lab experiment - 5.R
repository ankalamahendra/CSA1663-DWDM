age <- c(23, 23, 27, 27, 39, 41, 47, 49, 50, 52, 54, 54, 56, 57, 58, 58, 60, 61)
fat <- c(9.5, 26.5, 7.8, 17.8, 31.4, 25.9, 27.4, 27.2, 31.2, 34.6, 42.5, 28.8, 33.4, 
         30.2, 34.1, 32.9, 41.2, 35.7)

# (a) Calculate the mean, median, and standard deviation
mean_age <- mean(age)
median_age <- median(age)
sd_age <- sd(age)

mean_fat <- mean(fat)
median_fat <- median(fat)
sd_fat <- sd(fat)

# Print the results
cat("Mean of Age:", mean_age, "\n")
cat("Median of Age:", median_age, "\n")
cat("Standard Deviation of Age:", sd_age, "\n")

cat("Mean of %Fat:", mean_fat, "\n")
cat("Median of %Fat:", median_fat, "\n")
cat("Standard Deviation of %Fat:", sd_fat, "\n")

# (b) Draw the boxplots for age and %fat
par(mfrow = c(1, 2))  # Set up the plotting area to have 1 row and 2 columns
boxplot(age, main = "Boxplot of Age", ylab = "Age")
boxplot(fat, main = "Boxplot of %Fat", ylab = "%Fat")

# (c) Draw a scatter plot and a Q-Q plot based on these two variables
par(mfrow = c(1, 2))  # Set up the plotting area to have 1 row and 2 columns
plot(age, fat, main = "Scatter Plot of Age vs %Fat", xlab = "Age", ylab = "%Fat", pch = 19)
qqplot(age, fat, main = "Q-Q Plot of Age vs %Fat", xlab = "Quantiles of Age",
       ylab = "Quantiles of %Fat")
qqline(fat, col = "red")  # Add a Q-Q line for reference
