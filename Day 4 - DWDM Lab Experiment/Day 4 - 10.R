# Load required libraries
library(arules)
library(arulesViz)

# Create the transaction data
transactions <- read.transactions(
  textConnection("
  SONY,BPL,LG
  BPL,SAMSUNG
  BPL,ONIDA
  SONY,BPL,SAMSUNG
  SONY,ONIDA
  BPL,ONIDA
  SONY,ONIDA
  SONY,BPL,ONIDA,LG
  SONY,BPL,ONIDA
  "), format = "basket", sep = ","
)

# Summarize the transaction data
summary(transactions)

# Apply the Apriori algorithm
rules_apriori <- apriori(transactions, parameter = list(supp = 2/9, conf = 0.5))

# Inspect the rules generated by Apriori
inspect(rules_apriori)

# Apply the FP-Growth algorithm (using the eclat function with tidLists parameter)
rules_fp_growth <- eclat(transactions, parameter = list(supp = 2/9, maxlen = 10), control = list(verbose = TRUE))

# Convert itemsets to rules
rules_fp_growth <- ruleInduction(rules_fp_growth, transactions, confidence = 0.5)

# Inspect the rules generated by FP-Growth
inspect(rules_fp_growth)

# Compare the rules generated by both algorithms
rules_apriori <- sort(rules_apriori, by = "confidence")
rules_fp_growth <- sort(rules_fp_growth, by = "confidence")

# Unique rules in Apriori
unique_rules_apriori <- setdiff(rules_apriori, rules_fp_growth)
inspect(unique_rules_apriori)

# Unique rules in FP-Growth
unique_rules_fp_growth <- setdiff(rules_fp_growth, rules_apriori)
inspect(unique_rules_fp_growth)

# Common rules
common_rules <- intersect(rules_apriori, rules_fp_growth)
inspect(common_rules)
