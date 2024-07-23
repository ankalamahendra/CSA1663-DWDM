pencils <- c(9, 25, 23, 12, 11, 6, 7, 8, 9, 10)

# Calculate mean
mean_pencils <- mean(pencils)
cat("Mean:", mean_pencils, "\n")

# Calculate median
median_pencils <- median(pencils)
cat("Median:", median_pencils, "\n")

# Function to calculate mode
calculate_mode <- function(x) {
  uniq_x <- unique(x)
  uniq_x[which.max(tabulate(match(x, uniq_x)))]
}

# Calculate mode
mode_pencils <- calculate_mode(pencils)
cat("Mode:", mode_pencils, "\n")
