# Load the necessary library
library(ggplot2)

# Load the dataset
diabetes_data <- read.csv("diabetes.csv")

# Display the structure of the dataset
str(diabetes_data)
# Create a scatterplot
scatter_plot <- ggplot(data = diabetes_data, aes(x = Age, y = BloodPressure)) +
  geom_point() +
  labs(title = "Scatterplot of BloodPressure vs Age",
       x = "Age", y = "BloodPressure")
print(scatter_plot)
# Create age groups
age_group_data <- diabetes_data %>%
  mutate(AgeGroup = cut(Age, breaks = c(20, 30, 40, 50, 60, 70, Inf),
                        labels = c("20-29", "30-39", "40-49", "50-59", "60-69", "70+")))

# Calculate average blood pressure by age group
avg_bp_by_age_group <- age_group_data %>%
  group_by(AgeGroup) %>%
  summarise(AvgBloodPressure = mean(BloodPressure))

# Create a bar chart
bar_chart <- ggplot(data = avg_bp_by_age_group, aes(x = AgeGroup, y = AvgBloodPressure)) +
  geom_bar(stat = "identity", fill = "skyblue") +
  labs(title = "Average Blood Pressure by Age Group",
       x = "Age Group", y = "Average Blood Pressure")
print(bar_chart)
