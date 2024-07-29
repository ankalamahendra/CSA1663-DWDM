# Load necessary libraries
library(ggplot2)

# Create a data frame with the results
results <- data.frame(
  Metric = rep(c("Accuracy", "Precision", "Recall", "F1-Score"), 2),
  Value = c(76.3, 78, 76, 77, 78.9, 80, 79, 79), # Example values
  Classifier = rep(c("Decision Tree", "SVM"), each = 4)
)

# Plot the comparison
ggplot(results, aes(x = Metric, y = Value, fill = Classifier)) +
  geom_bar(stat = "identity", position = "dodge") +
  labs(title = "Comparison of Decision Tree and SVM Classifiers", x = "Metric", y = "Value (%)") +
  theme_minimal()
