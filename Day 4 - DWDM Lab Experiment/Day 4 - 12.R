# Load required libraries
library(arules)

# Given transactions
transactions <- list(
  T100 = c("M", "O", "N", "K", "E", "Y"),
  T200 = c("D", "O", "N", "K", "E", "Y"),
  T300 = c("M", "A", "K", "E"),
  T400 = c("M", "U", "C", "K", "Y"),
  T500 = c("C", "O", "O", "K", "I", "E")
)

# Convert to transactions class
trans <- as(transactions, "transactions")

# Apply Apriori algorithm
rules_apriori <- apriori(trans, parameter = list(supp = 0.4, conf = 0.7))
inspect(rules_apriori)

# Apply FP-Growth algorithm using eclat
itemsets_fp_growth <- eclat(trans, parameter = list(supp = 0.4))
rules_fp_growth <- ruleInduction(itemsets_fp_growth, trans, confidence = 0.7)
inspect(rules_fp_growth)

# Compare efficiency (example timing comparison)
system.time(apriori(trans, parameter = list(supp = 0.4, conf = 0.7)))
system.time(eclat(trans, parameter = list(supp = 0.4)))
