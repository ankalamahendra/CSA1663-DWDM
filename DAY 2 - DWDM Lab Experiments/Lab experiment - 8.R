# Load the necessary dataset
data("mtcars")

# Create a boxplot graph
boxplot(mpg ~ cyl, data = mtcars,
        xlab = "Number of Cylinders", ylab = "Miles per Gallon",
        main = "Boxplot of MPG by Number of Cylinders",
        col = "skyblue", border = "black")

# Optionally, display the dataset to confirm its contents
head(mtcars)
