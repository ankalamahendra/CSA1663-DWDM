# Given data
data <- c(100, 70, 60, 90, 90)

# (a) Min-Max Normalization
min_val <- min(data)
max_val <- max(data)
min_max_normalized <- (data - min_val) / (max_val - min_val)
cat("(a) Min-Max Normalization:\n", min_max_normalized, "\n\n")

# (b) Z-Score Normalization
mean_val <- mean(data)
sd_val <- sd(data)
z_score_normalized <- (data - mean_val) / sd_val
cat("(b) Z-Score Normalization:\n", z_score_normalized, "\n\n")

# (c) Z-Score Normalization using Mean Absolute Deviation
mean_abs_dev <- mean(abs(data - mean_val))
z_score_mad_normalized <- (data - mean_val) / mean_abs_dev
cat("(c) Z-Score Normalization using Mean Absolute Deviation:\n", z_score_mad_normalized, "\n\n")

# (d) Normalization by Decimal Scaling
j <- ceiling(log10(max(abs(data))))
decimal_scaling_normalized <- data / (10^j)
cat("(d) Normalization by Decimal Scaling:\n", decimal_scaling_normalized, "\n")
