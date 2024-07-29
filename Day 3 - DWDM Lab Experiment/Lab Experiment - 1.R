# Install and load necessary libraries
if(!require(arules)) install.packages("arules", dependencies = TRUE)
if(!require(arulesSequences)) install.packages("arulesSequences", dependencies = TRUE)
library(arules)
library(arulesSequences)

# Create the transactions dataset
transactions <- list(
  c("a", "d", "e"),
  c("a", "b", "c", "e"),
  c("a", "b", "d", "e"),
  c("a", "c", "d", "e"),
  c("b", "c", "e"),
  c("b", "d", "e"),
  c("c", "d"),
  c("a", "b", "c"),
  c("a", "d", "e"),
  c("a", "b", "e")
)

# Convert the list to transactions
trans <- as(transactions, "transactions")

# Perform the Apriori algorithm
apriori_rules <- apriori(trans, parameter = list(supp = 3/10, conf = 0.5))

# Display the Apriori rules
inspect(apriori_rules)

# Perform the FP-Growth algorithm using the cSPADE function from arulesSequences
# Convert transactions to a suitable format for arulesSequences
seq_trans <- as(transactions, "transactions")
seq_trans <- as(seq_trans, "sequences")

# Run the cSPADE algorithm for frequent sequence mining
fp_growth_rules <- cspade(seq_trans, parameter = list(support = 3/10))

# Convert the result into rules
fp_growth_rules <- as(fp_growth_rules, "rules")

# Display the FP-Growth rules
inspect(fp_growth_rules)
