# Define the intervals and their corresponding frequencies
age_intervals <- c("1-5", "5-15", "15-20", "20-50", "50-80", "80-110")
frequencies <- c(200, 450, 300, 1500, 700, 44)

# Calculate the cumulative frequencies
cumulative_frequencies <- cumsum(frequencies)

# Total number of observations
total_observations <- sum(frequencies)

# Find the median class
median_class_index <- which(cumulative_frequencies >= total_observations / 2)[1]

# Median class details
median_class <- age_intervals[median_class_index]
median_class_frequency <- frequencies[median_class_index]
cumulative_frequency_before_median <- ifelse(median_class_index == 1, 0, cumulative_frequencies[median_class_index - 1])

# Find the lower boundary of the median class
median_class_boundaries <- as.numeric(unlist(strsplit(median_class, "-")))
lower_boundary <- median_class_boundaries[1]
upper_boundary <- median_class_boundaries[2]

# Calculate the class width
class_width <- upper_boundary - lower_boundary

# Calculate the median using the formula
median <- lower_boundary + ((total_observations / 2 - cumulative_frequency_before_median) / median_class_frequency) * class_width

# Print the result
print(paste("The approximate median value is:", round(median, 2)))

