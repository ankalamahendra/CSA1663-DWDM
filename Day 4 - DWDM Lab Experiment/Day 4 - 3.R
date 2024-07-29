# Load necessary libraries
library(ggplot2)

# Create a data frame with the results
results <- data.frame(
  Metric = rep(c("Accuracy", "Precision", "Recall", "F1-Score"), 2),
  Value = c(96.67, 96.67, 96.67, 96.67, 96.00, 96.00, 96.00, 96.00), # Example values
  Classifier = rep(c("NaiveBayes", "SVM"), each = 4)
)

# Plot the comparison
ggplot(results, aes(x = Metric, y = Value, fill = Classifier)) +
  geom_bar(stat = "identity", position = "dodge") +
  labs(title = "Comparison of Naive Bayes and SVM Classifiers", x = "Metric", y = "Value (%)") +
  theme_minimal()
