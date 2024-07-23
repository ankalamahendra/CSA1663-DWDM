# Data for Class A and Class B
classA <- c(76, 35, 47, 64, 95, 66, 89, 36, 84)
classB <- c(51, 56, 84, 60, 59, 70, 63, 66, 50)

# Calculate mean, median, and range for Class A
mean_A <- mean(classA)
median_A <- median(classA)
range_A <- max(classA) - min(classA)

# Calculate mean, median, and range for Class B
mean_B <- mean(classB)
median_B <- median(classB)
range_B <- max(classB) - min(classB)

# Compare means
if (mean_A > mean_B) {
  mean_higher <- "Class A"
} else if (mean_A < mean_B) {
  mean_higher <- "Class B"
} else {
  mean_higher <- "Both classes have the same mean"
}

# Compare medians
if (median_A > median_B) {
  median_higher <- "Class A"
} else if (median_A < median_B) {
  median_higher <- "Class B"
} else {
  median_higher <- "Both classes have the same median"
}

# Compare ranges
if (range_A > range_B) {
  range_higher <- "Class A"
} else if (range_A < range_B) {
  range_higher <- "Class B"
} else {
  range_higher <- "Both classes have the same range"
}

# Print results
cat("Mean: Class", mean_higher, "had a higher mean.\n")
cat("Median: Class", median_higher, "had a higher median.\n")
cat("Range: Class", range_higher, "had a higher range.\n")
# Combine data for both classes
combined_data <- data.frame(Class = c(rep("A", length(classA)), rep("B", length(classB))),
                            Score = c(classA, classB))

# Create a boxplot
boxplot(Score ~ Class, data = combined_data,
        main = "Boxplot of Exam Scores by Class",
        xlab = "Class", ylab = "Scores")

# Provide inferences
cat("\nInferences based on the boxplot:\n")
cat("- Class A has a wider range of scores compared to Class B.\n")
cat("- Class A's distribution appears to be skewed towards higher scores, while Class B's distribution is more symmetric.\n")
cat("- Class A has a higher median and a more spread-out interquartile range compared to Class B.\n")
