# Load the necessary dataset
data("mtcars")
# Create a line chart with the first line (mpg)
plot(mtcars$qsec, mtcars$mpg, type = "l", col = "blue", xlab = "qsec", ylab = "mpg", main = "Line Chart with Multiple Lines")
# Add the second line (qsec) using the lines() function
lines(mtcars$qsec, mtcars$qsec, col = "red")
