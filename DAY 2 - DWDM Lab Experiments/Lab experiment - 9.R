# Sample data: Points scored by players
points_scored <- c(12, 15, 14, 13, 20, 22, 19, 30, 25, 28, 31, 45, 50)

# Create the boxplot
boxplot(points_scored,
        main = "Boxplot of Points Scored by Tennis Players",
        ylab = "Points Scored",
        col = "lightgreen",
        border = "black")

# Add grid for better readability
grid()
