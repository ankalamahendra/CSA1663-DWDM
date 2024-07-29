# Install and load necessary libraries
if (!require(arules)) install.packages("arules")
if (!require(arulesViz)) install.packages("arulesViz")
if (!require(arulesSequences)) install.packages("arulesSequences")
library(arules)
library(arulesViz)
library(arulesSequences)

# Create the dataset
transactions <- list(
  c("M", "O", "N", "K", "E", "Y"),
  c("D", "O", "N", "K", "E", "Y"),
  c("M", "A", "K", "E"),
  c("M", "U", "C", "K", "Y"),
  c("C", "O", "O", "K", "I", "E")
)

# Convert the list to transactions format
trans <- as(transactions, "transactions")

# Summary of the transactions
summary(trans)

# Apply Apriori algorithm
apriori_rules <- apriori(trans, parameter = list(supp = 0.5, conf = 0.8))

# Summary of the rules
summary(apriori_rules)

# Inspect the rules
inspect(apriori_rules)

# Apply FP-Growth algorithm (Using cspade function for sequence mining)
fp_rules <- cspade(trans, parameter = list(support = 0.5))

# Inspect the rules
inspect(fp_rules)
