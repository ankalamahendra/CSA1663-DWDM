age_data <- c(13, 15, 16, 16, 19, 20, 20, 21, 22, 22, 25, 25, 25, 25, 30, 33, 33, 35, 
              35, 35, 35, 36, 40, 45, 46, 52, 70)

# (a) Calculate mean and median
mean_age <- mean(age_data)
median_age <- median(age_data)

# (b) Calculate mode
mode_age <- as.numeric(names(sort(table(age_data), decreasing = TRUE)[1]))

# (c) Calculate midrange
midrange_age <- (min(age_data) + max(age_data)) / 2

# (d) Calculate first quartile (Q1) and third quartile (Q3)
Q1 <- quantile(age_data, 0.25)
Q3 <- quantile(age_data, 0.75)

# Print the results
cat("Mean:", mean_age, "\n")
cat("Median:", median_age, "\n")
cat("Mode:", mode_age, "\n")
cat("Midrange:", midrange_age, "\n")
cat("First Quartile (Q1):", Q1, "\n")
cat("Third Quartile (Q3):", Q3, "\n")
