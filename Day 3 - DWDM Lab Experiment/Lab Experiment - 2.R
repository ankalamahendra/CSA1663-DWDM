# Install and load necessary libraries
if(!require(arules)) install.packages("arules", dependencies = TRUE)
library(arules)

# Create the transactions dataset
transactions <- list(
  c("Milk", "Beer", "Diapers"),
  c("Bread", "Butter", "Milk"),
  c("Milk", "Diapers", "Cookies"),
  c("Bread", "Butter", "Cookies"),
  c("Beer", "Cookies", "Diapers"),
  c("Milk", "Diapers", "Bread", "Butter"),
  c("Bread", "Butter", "Diapers"),
  c("Beer", "Diapers"),
  c("Milk", "Diapers", "Bread", "Butter"),
  c("Beer", "Cookies")
)

# Convert the list to transactions
trans <- as(transactions, "transactions")

# Unique items in the dataset
items <- unique(unlist(transactions))
n <- length(items)

# Maximum number of association rules
max_rules <- 3^n - 2^(n+1) + 1
cat("Maximum number of association rules:", max_rules, "\n")

# Maximum size of frequent itemsets
max_size <- max(sapply(transactions, length))
cat("Maximum size of frequent itemsets:", max_size, "\n")
