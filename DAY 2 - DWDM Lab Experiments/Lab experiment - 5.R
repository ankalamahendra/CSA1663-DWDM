# Load the necessary library
library(datasets)

# Load the AirPassengers dataset
data("AirPassengers")

# Set up the histogram parameters
start_value <- 100
end_value <- 700
bin_width <- 150

# Create the histogram
hist(AirPassengers, breaks = seq(start_value, end_value, by = bin_width),
     xlab = "Passenger Count", ylab = "Frequency",
     main = "Histogram of AirPassengers",
     col = "skyblue", border = "black")
