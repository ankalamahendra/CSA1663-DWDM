# Data points for speed
speed <- c(78.3, 81.8, 82, 74.2, 83.4, 84.5, 82.9, 77.5, 80.9, 70.6)

# Calculate the IQR
iqr_speed <- IQR(speed)

# Print the IQR
print(paste("Interquartile Range (IQR):", iqr_speed))

# Calculate the standard deviation
sd_speed <- sd(speed)

# Print the standard deviation
print(paste("Standard Deviation:", sd_speed))
