# Step 1: Create vectors for the persons and their vegetarian status
persons <- c("Gopu", "Babu", "Baby", "Gopal", "Krishna", "Jai", "Dev", "Malini", "Hema", "Anu")
vegetarian_status <- c("yes", "yes", "yes", "no", "yes", "no", "no", "yes", "yes", "yes")

# Step 2: Count the number of vegetarians and non-vegetarians
num_vegetarian <- sum(vegetarian_status == "yes")
num_non_vegetarian <- sum(vegetarian_status == "no")

# Print the counts
cat("Number of vegetarians:", num_vegetarian, "\n")
cat("Number of non-vegetarians:", num_non_vegetarian, "\n")

# Step 3: Determine which group has a greater count
if (num_vegetarian > num_non_vegetarian) {
  cat("There are more vegetarians.\n")
} else if (num_non_vegetarian > num_vegetarian) {
  cat("There are more non-vegetarians.\n")
} else {
  cat("The number of vegetarians and non-vegetarians is equal.\n")
}
