# Given data
data <- c(200, 300, 400, 600, 1000)

# (a) Min-Max Normalization (min = 0, max = 1)
min_val <- min(data)
max_val <- max(data)

min_max_normalized_data <- (data - min_val) / (max_val - min_val)

# (b) Z-Score Normalization
mean_data <- mean(data)
sd_data <- sd(data)

z_score_normalized_data <- (data - mean_data) / sd_data

# Print the results
cat("Original Data:", data, "\n")
cat("Min-Max Normalized Data:", min_max_normalized_data, "\n")
cat("Z-Score Normalized Data:", z_score_normalized_data, "\n")
