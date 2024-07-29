# Install and load necessary packages
install.packages("arules")
install.packages("RWeka")

library(arules)
library(RWeka)

# Load the dataset
transactions <- read.transactions("path/to/transactions.arff", format = "arff")

# Inspect the dataset
inspect(transactions)

# Apply Apriori algorithm
rules_apriori <- apriori(transactions, parameter = list(supp = 0.3333, conf = 0.6))

# Display rules
inspect(rules_apriori)

# Apply FP-Growth algorithm
rules_fpgrowth <- fpgrowth(transactions, parameter = list(supp = 0.3333, conf = 0.6))

# Display rules
inspect(rules_fpgrowth)

# Evaluate rules
rules_apriori_accepted <- rules_apriori[quality(rules_apriori)$confidence >= 0.6]
rules_fpgrowth_accepted <- rules_fpgrowth[quality(rules_fpgrowth)$confidence >= 0.6]

print("Apriori Accepted Rules")
inspect(rules_apriori_accepted)

print("FP-Growth Accepted Rules")
inspect(rules_fpgrowth_accepted)

print("Apriori Rejected Rules")
inspect(rules_apriori[quality(rules_apriori)$confidence < 0.6])

print("FP-Growth Rejected Rules")
inspect(rules_fpgrowth[quality(rules_fpgrowth)$confidence < 0.6])

# Plotting results
plot(rules_apriori_accepted, method="graph")
plot(rules_fpgrowth_accepted, method="graph")

# Assume we have the accuracies from WEKA
decision_tree_accuracy <- 0.85  # Replace with actual accuracy from WEKA
rule_based_accuracy <- 0.78     # Replace with actual accuracy from WEKA

# Create a data frame for plotting
accuracy_data <- data.frame(
  Algorithm = c("Decision Tree", "Rule-based"),
  Accuracy = c(decision_tree_accuracy, rule_based_accuracy)
)

# Plot the accuracies
library(ggplot2)

ggplot(accuracy_data, aes(x = Algorithm, y = Accuracy, fill = Algorithm)) +
  geom_bar(stat = "identity") +
  ylim(0, 1) +
  ggtitle("Accuracy Comparison of Decision Tree and Rule-based Classifiers") +
  ylab("Accuracy") +
  xlab("Algorithm")

