# Given data
age <- c(23, 23, 27, 27, 39, 41, 47, 49, 50, 52, 54, 54, 56, 57, 58, 58, 60, 61)
value_to_normalize <- 35

# Min-Max Normalization
min_age <- min(age)
max_age <- max(age)
min_max_normalized <- (value_to_normalize - min_age) / (max_age - min_age)
cat("Min-Max Normalized Value:", min_max_normalized, "\n")

# Z-Score Normalization
mean_age <- mean(age)
std_dev_age <- 12.94
z_score_normalized <- (value_to_normalize - mean_age) / std_dev_age
cat("Z-Score Normalized Value:", z_score_normalized, "\n")

# Decimal Scaling Normalization
j <- ceiling(log10(max(abs(age))))
decimal_scaled <- value_to_normalize / (10^j)
cat("Decimal Scaled Value:", decimal_scaled, "\n")
