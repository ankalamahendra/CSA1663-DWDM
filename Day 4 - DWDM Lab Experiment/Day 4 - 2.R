# Load necessary libraries
library(ggplot2)

# Load the dataset from CSV file
employee_data <- read.csv("employee_data.csv")

# View the dataset
print(employee_data)

# Select the relevant features for clustering
employee_features <- employee_data[, c("Age", "Salary", "Credit")]

# Standardize the data
employee_features <- scale(employee_features)

# Determine the optimal number of clusters using the elbow method
set.seed(123)
wss <- (nrow(employee_features) - 1) * sum(apply(employee_features, 2, var))
for (i in 2:10) {
  wss[i] <- sum(kmeans(employee_features, centers = i)$withinss)
}

# Plot the elbow curve
plot(1:10, wss, type = "b", xlab = "Number of Clusters", ylab = "Within groups sum of squares")

# Perform k-means clustering with the optimal number of clusters (let's assume 3 for this example)
set.seed(123)
kmeans_result <- kmeans(employee_features, centers = 3, nstart = 25)

# Add the cluster results to the original data
employee_data$Cluster <- as.factor(kmeans_result$cluster)

# View the clustered data
print(employee_data)

# Plot the clusters
ggplot(employee_data, aes(x = Age, y = Salary, color = Cluster)) +
  geom_point(size = 4) +
  labs(title = "Employee Segments", x = "Age", y = "Salary") +
  theme_minimal()

# Plot another graph for Age vs Credit
ggplot(employee_data, aes(x = Age, y = Credit, color = Cluster)) +
  geom_point(size = 4) +
  labs(title = "Employee Segments", x = "Age", y = "Credit") +
  theme_minimal()

# Summary of the clusters
summary(employee_data)
