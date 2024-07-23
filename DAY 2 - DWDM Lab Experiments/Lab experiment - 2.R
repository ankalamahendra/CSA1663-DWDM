# Data points
prices <- c(1, 1, 5, 5, 5, 5, 5, 8, 8, 10, 10, 10, 10, 12, 14, 14, 14, 15, 15, 15, 15, 15, 15, 18, 18, 18, 18, 18, 20, 20, 20, 20, 20, 20, 21, 21, 21, 21, 25, 25, 25, 25, 25, 28, 28, 30)
# Number of bins
num_bins <- 3
# Number of data points per bin
bin_size <- length(prices) / num_bins

# Sorting the data
sorted_prices <- sort(prices)

# Creating the bins
bins_equal_frequency <- split(sorted_prices, ceiling(seq_along(sorted_prices) / bin_size))

# Display the bins
print("Equal-Frequency Bins:")
print(bins_equal_frequency)

# Calculate bin means and smooth data
bin_means <- lapply(bins_equal_frequency, mean)
smooth_bin_means <- unlist(lapply(seq_along(bins_equal_frequency), function(i) rep(bin_means[[i]], length(bins_equal_frequency[[i]]))))

# Display smoothed data using bin means
print("Smoothed Data (Bin Means):")
print(smooth_bin_means)

# Calculate bin boundaries and smooth data
smooth_bin_boundaries <- unlist(lapply(bins_equal_frequency, function(bin) {
  min_val <- min(bin)
  max_val <- max(bin)
  return(sapply(bin, function(x) {
    if (x - min_val <= max_val - x) min_val else max_val
  }))
}))

# Display smoothed data using bin boundaries
print("Smoothed Data (Bin Boundaries):")
print(smooth_bin_boundaries)

# Load necessary library
library(ggplot2)

# Convert data to data frames for ggplot
df_original <- data.frame(prices)
df_means <- data.frame(prices = smooth_bin_means)
df_boundaries <- data.frame(prices = smooth_bin_boundaries)

# Plot histograms
ggplot(df_original, aes(x=prices)) +
  geom_histogram(bins=15, fill="blue", color="black", alpha=0.7) +
  ggtitle("Original Data") +
  xlab("Prices") +
  ylab("Frequency") +
  theme_minimal()

ggplot(df_means, aes(x=prices)) +
  geom_histogram(bins=15, fill="green", color="black", alpha=0.7) +
  ggtitle("Smoothed Data (Bin Means)") +
  xlab("Prices") +
  ylab("Frequency") +
  theme_minimal()

ggplot(df_boundaries, aes(x=prices)) +
  geom_histogram(bins=15, fill="red", color="black", alpha=0.7) +
  ggtitle("Smoothed Data (Bin Boundaries)") +
  xlab("Prices") +
  ylab("Frequency") +
  theme_minimal()
