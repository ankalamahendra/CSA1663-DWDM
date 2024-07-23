data <- c(200, 300, 400, 600, 1000)
v <- 80
min_value <- 50000
max_value <- 100000
# Min-Max Normalization formula: (x - min) / (max - min)
min_max_normalized_a <- (data - min(data)) / (max(data) - min(data))

cat("Min-Max Normalization (Method A):\n")
print(min_max_normalized_a)
# Z-Score Normalization formula: (x - mean) / standard deviation
z_score_normalized <- (data - mean(data)) / sd(data)

cat("\nZ-Score Normalization:\n")
print(z_score_normalized)
