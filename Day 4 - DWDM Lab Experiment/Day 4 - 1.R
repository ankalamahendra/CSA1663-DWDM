# Load necessary libraries
library(ggplot2)
library(cluster)

# Sample dataset based on the provided data
customer_data <- data.frame(
  CustomerID = c(1, 2, 3, 4, 5),
  Gender = c('Male', 'Male', 'Female', 'Female', 'Female'),
  Age = c(19, 21, 20, 23, 31),
  AnnualIncome = c(15, 15, 16, 16, 17),
  SpendingScore = c(39, 81, 6, 77, 40)
)

# View the dataset
print(customer_data)

# Select the relevant features for clustering
customer_features <- customer_data[, c("AnnualIncome", "SpendingScore")]

# Standardize the data
customer_features <- scale(customer_features)

# Determine the optimal number of clusters using the elbow method
set.seed(123)
wss <- (nrow(customer_features)-1)*sum(apply(customer_features, 2, var))
for (i in 2:10) {
  wss[i] <- sum(kmeans(customer_features, centers=i)$withinss)
}

# Plot the elbow curve
plot(1:10, wss, type="b", xlab="Number of Clusters", ylab="Within groups sum of squares")

# Perform k-means clustering with the optimal number of clusters (let's assume 5 for this example)
set.seed(123)
kmeans_result <- kmeans(customer_features, centers=5, nstart=25)

# Add the cluster results to the original data
customer_data$Cluster <- as.factor(kmeans_result$cluster)

# View the clustered data
print(customer_data)

# Plot the clusters
ggplot(customer_data, aes(x=AnnualIncome, y=SpendingScore, color=Cluster)) +
  geom_point(size=4) +
  labs(title="Customer Segments", x="Annual Income (k$)", y="Spending Score (1-100)") +
  theme_minimal()

# Summary of the clusters
summary(customer_data)
