# Install necessary packages
install.packages("e1071")
install.packages("caret")
install.packages("rpart")
install.packages("rpart.plot")

# Load necessary libraries
library(e1071)  # For Naive Bayes
library(caret)  # For creating train/test splits and confusion matrix
library(rpart)  # For decision tree
library(rpart.plot)  # For plotting decision trees

# Create the dataset
data <- data.frame(
  RID = 1:14,
  age = c('<=30', '<=30', '31...40', '>40', '>40', '>40', '31...40', '<=30', '<=30', '>40', '<=30', '31...40', '31...40', '>40'),
  income = c('high', 'high', 'high', 'medium', 'low', 'low', 'low', 'medium', 'low', 'medium', 'medium', 'medium', 'high', 'medium'),
  student = c('no', 'no', 'no', 'no', 'yes', 'yes', 'yes', 'no', 'yes', 'yes', 'yes', 'no', 'yes', 'no'),
  credit_rating = c('fair', 'excellent', 'fair', 'fair', 'fair', 'excellent', 'excellent', 'fair', 'fair', 'fair', 'excellent', 'excellent', 'fair', 'excellent'),
  buys_computer = c('no', 'no', 'yes', 'yes', 'yes', 'no', 'yes', 'no', 'yes', 'yes', 'yes', 'yes', 'yes', 'no')
)

# Convert to factors
data$age <- as.factor(data$age)
data$income <- as.factor(data$income)
data$student <- as.factor(data$student)
data$credit_rating <- as.factor(data$credit_rating)
data$buys_computer <- as.factor(data$buys_computer)

# Split the data into training and testing sets
set.seed(123)  # For reproducibility
trainIndex <- createDataPartition(data$buys_computer, p = 0.7, list = FALSE)
data_train <- data[trainIndex, ]
data_test <- data[-trainIndex, ]

# Train Naive Bayes model
nb_model <- naiveBayes(buys_computer ~ ., data = data_train)
nb_predictions <- predict(nb_model, data_test)

# Evaluate Naive Bayes model
nb_confusion_matrix <- confusionMatrix(nb_predictions, data_test$buys_computer)
print("Naive Bayes Confusion Matrix")
print(nb_confusion_matrix)

# Train Decision Tree model
dt_model <- rpart(buys_computer ~ ., data = data_train, method = "class")
dt_predictions <- predict(dt_model, data_test, type = "class")

# Evaluate Decision Tree model
dt_confusion_matrix <- confusionMatrix(dt_predictions, data_test$buys_computer)
print("Decision Tree Confusion Matrix")
print(dt_confusion_matrix)

# Plot the Decision Tree
rpart.plot(dt_model, type = 3, extra = 102, fallen.leaves = TRUE, main = "Decision Tree for Buys Computer")
