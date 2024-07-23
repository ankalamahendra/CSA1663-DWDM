# Data points
marks <- c(55, 60, 71, 63, 55, 65, 50, 55, 58, 59, 61, 63, 65, 67, 71, 72, 75)

# Number of bins
num_bins <- 3

# Equal-Frequency (Equi-Depth) Partitioning
# Number of data points per bin
bin_size <- length(marks) / num_bins

# Sorting the data
sorted_marks <- sort(marks)

# Creating the bins
bins_equal_frequency <- split(sorted_marks, ceiling(seq_along(sorted_marks) / bin_size))

# Display the bins
print("Equal-Frequency Bins:")
print(bins_equal_frequency)

# Equal-Width Partitioning
# Calculate the range of the data
range_marks <- range(marks)
min_mark <- range_marks[1]
max_mark <- range_marks[2]

# Calculate the width of each bin
bin_width <- (max_mark - min_mark) / num_bins

# Create the bins using cut
bins_equal_width <- cut(marks, breaks=seq(min_mark, max_mark, by=bin_width), include.lowest=TRUE, right=FALSE)

# Display the bins
print("Equal-Width Bins:")
print(split(marks, bins_equal_width))

# Load necessary library
library(ggplot2)

# Convert data to a data frame for ggplot
df <- data.frame(marks)

# Equal-Frequency Histogram
ggplot(df, aes(x=marks)) +
  geom_histogram(bins=3, fill="blue", color="black", alpha=0.7) +
  ggtitle("Equal-Frequency Partitioning") +
  xlab("Marks") +
  ylab("Frequency")

# Equal-Width Histogram
ggplot(df, aes(x=marks)) +
  geom_histogram(breaks=seq(min_mark, max_mark, by=bin_width), fill="green", color="black", alpha=0.7) +
  ggtitle("Equal-Width Partitioning") +
  xlab("Marks") +
  ylab("Frequency")
