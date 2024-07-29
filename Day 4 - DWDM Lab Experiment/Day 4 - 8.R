# Load necessary libraries
library(ggplot2)
library(gridExtra)

# Step 1: Create a vector of the marks
marks <- c(55, 60, 71, 63, 55, 65, 50, 55, 58, 59, 61, 63, 65, 67, 71, 72, 75)

# Step 2: Equal-frequency (equi-depth) partitioning
equal_frequency_bins <- cut(marks, breaks = quantile(marks, probs = seq(0, 1, by = 1/3)), include.lowest = TRUE)
table(equal_frequency_bins)

# Step 3: Equal-width partitioning
equal_width_bins <- cut(marks, breaks = seq(min(marks), max(marks), length.out = 4), include.lowest = TRUE)
table(equal_width_bins)

# Step 4: Clustering using k-means
set.seed(42) # For reproducibility
kmeans_result <- kmeans(marks, centers = 3)
cluster_bins <- factor(kmeans_result$cluster, labels = c("Cluster 1", "Cluster 2", "Cluster 3"))
table(cluster_bins)

# Step 5: Plot histograms for each partitioning method
# Plot histogram for equal-frequency partitioning
hist_equal_frequency <- ggplot(data.frame(marks, equal_frequency_bins), aes(x = marks)) +
  geom_histogram(aes(fill = equal_frequency_bins), bins = 10, color = "black", position = "identity") +
  labs(title = "Equal-Frequency Partitioning", x = "Marks", y = "Count")

# Plot histogram for equal-width partitioning
hist_equal_width <- ggplot(data.frame(marks, equal_width_bins), aes(x = marks)) +
  geom_histogram(aes(fill = equal_width_bins), bins = 10, color = "black", position = "identity") +
  labs(title = "Equal-Width Partitioning", x = "Marks", y = "Count")

# Plot histogram for clustering
hist_clustering <- ggplot(data.frame(marks, cluster_bins), aes(x = marks)) +
  geom_histogram(aes(fill = cluster_bins), bins = 10, color = "black", position = "identity") +
  labs(title = "Clustering Partitioning", x = "Marks", y = "Count")

# Arrange all histograms in one plot
grid.arrange(hist_equal_frequency, hist_equal_width, hist_clustering, nrow = 3)
