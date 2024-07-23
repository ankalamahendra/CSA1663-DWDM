data <- c(11, 13, 13, 15, 15, 16, 19, 20, 20, 20, 21, 21, 22, 23, 24, 30, 40, 45, 45, 45, 
          71, 72, 73, 75)

num_bins <- 4

# Calculate bin size
bin_size <- length(data) / num_bins

# Divide data into bins
bins <- split(data, ceiling(seq_along(data) / bin_size))

# (a) Smoothing by bin mean
smoothed_by_mean <- unlist(lapply(bins, function(bin) {
  bin_mean <- mean(bin)
  rep(bin_mean, length(bin))
}))

# (b) Smoothing by bin median
smoothed_by_median <- unlist(lapply(bins, function(bin) {
  bin_median <- median(bin)
  rep(bin_median, length(bin))
}))

smoothed_by_boundaries <- unlist(lapply(bins, function(bin) {
  min_val <- min(bin)
  max_val <- max(bin)
  sapply(bin, function(x) ifelse(x - min_val <= max_val - x, min_val, max_val))
}))

cat("Original Data:", data, "\n")
cat("Smoothed by Bin Mean:", smoothed_by_mean, "\n")
cat("Smoothed by Bin Median:", smoothed_by_median, "\n")
cat("Smoothed by Bin Boundaries:", smoothed_by_boundaries, "\n")
