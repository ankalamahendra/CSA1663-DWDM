# Load necessary library
library(caret)
library(ggplot2)

# Example confusion matrices (fill with actual values from WEKA)
confusion_matrix_j48 <- matrix(c(6, 2, 1, 3), nrow = 2, byrow = TRUE)
confusion_matrix_jrip <- matrix(c(5, 3, 2, 2), nrow = 2, byrow = TRUE)

# Create data frames
confusion_df_j48 <- as.data.frame.table(as.table(confusion_matrix_j48))
confusion_df_jrip <- as.data.frame.table(as.table(confusion_matrix_jrip))

# Rename columns for clarity
colnames(confusion_df_j48) <- c("Prediction", "Reference", "Frequency")
colnames(confusion_df_jrip) <- c("Prediction", "Reference", "Frequency")

# Plot confusion matrix for J48
plot_j48 <- ggplot(confusion_df_j48, aes(x = Reference, y = Prediction, fill = Frequency)) +
  geom_tile() +
  geom_text(aes(label = Frequency), color = "white") +
  scale_fill_gradient(low = "blue", high = "red") +
  labs(title = "Confusion Matrix for J48 Decision Tree")

# Plot confusion matrix for JRip
plot_jrip <- ggplot(confusion_df_jrip, aes(x = Reference, y = Prediction, fill = Frequency)) +
  geom_tile() +
  geom_text(aes(label = Frequency), color = "white") +
  scale_fill_gradient(low = "blue", high = "red") +
  labs(title = "Confusion Matrix for JRip Rule-Based Induction")

# Display plots
grid.arrange(plot_j48, plot_jrip, nrow = 2)
