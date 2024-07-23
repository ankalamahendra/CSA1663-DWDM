x <- c(4, 1, 5, 7, 10, 2, 50, 25, 90, 36)
y <- c(12, 5, 13, 19, 31, 7, 153, 72, 275, 110)

# Create scatter plot
plot(x, y, main="Scatter Plot of Mobile Phones Sold vs. Money",
     xlab="Number of Mobile Phones Sold", ylab="Money",
     pch=19, col="blue")

# Optionally add a trend line (linear model)
abline(lm(y ~ x), col="red")
