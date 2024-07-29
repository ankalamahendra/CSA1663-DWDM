# Install and load necessary packages
install.packages("arules")
library(arules)

# Step 1: Create the transaction dataset
transactions <- list(
  c("Bread", "Cheese", "Egg", "Juice"),
  c("Bread", "Cheese", "Juice"),
  c("Bread", "Milk", "Yogurt"),
  c("Bread", "Juice", "Milk"),
  c("Cheese", "Juice", "Milk")
)

# Convert the list to transactions
trans <- as(transactions, "transactions")

# Step 2: Apply the FP-growth algorithm to generate frequent itemsets
# Set support to 50% (0.5)
frequent_itemsets <- apriori(trans, parameter = list(support = 0.5, target = "frequent itemsets"))

# Display frequent itemsets
inspect(frequent_itemsets)

# Step 3: Generate association rules based on the frequent itemsets
# Set confidence to 75% (0.75)
rules <- apriori(trans, parameter = list(support = 0.5, confidence = 0.75, target = "rules"))

# Display the rules
inspect(rules)
