# Creating a matrix with the provided preference data
preferences <- matrix(c(18, 2, 20, 22, 28, 10, 20, 40, 40), ncol = 3, byrow = TRUE)
rownames(preferences) <- c("5-6 years", "7-8 years", "9-10 years")
colnames(preferences) <- c("A", "B", "C")
# Calculate the sample covariance between B and C
cov_bc <- cov(preferences[, "B"], preferences[, "C"])
print("Sample Covariance between B and C:")
print(cov_bc)
# Calculate the sample covariance matrix for the preferences
cov_matrix <- cov(preferences)
print("Sample Covariance Matrix for Preferences:")
print(cov_matrix)
# Calculate the sample correlation between B and C
cor_bc <- cor(preferences[, "B"], preferences[, "C"])
print("Sample Correlation between B and C:")
print(cor_bc)

# Calculate the sample correlation matrix for the preferences
cor_matrix <- cor(preferences)
print("Sample Correlation Matrix for Preferences:")
print(cor_matrix)
