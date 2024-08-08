import pandas as pd
import numpy as np
import matplotlib.pyplot as plt
import seaborn as sns
from sklearn.model_selection import train_test_split
from sklearn.naive_bayes import GaussianNB
from sklearn.metrics import accuracy_score

# Generate synthetic dataset
np.random.seed(42)
num_samples = 1000

# Create random data
age = np.random.randint(21, 70, num_samples)
occupations = ['Engineer', 'Doctor', 'Artist', 'Lawyer', 'Scientist']
occupation = np.random.choice(occupations, num_samples)
annual_income = np.random.randint(30000, 120000, num_samples)
credit_score = np.random.randint(300, 850, num_samples)

# Create DataFrame
df = pd.DataFrame({
    'Age': age,
    'Occupation': occupation,
    'Annual_Income': annual_income,
    'Credit_Score': credit_score
})

# a. Print the first five rows
print("First five rows of the dataset:")
print(df.head())

# b. Basic statistical computations
print("\nBasic statistical computations:")
print(df.describe())

# c. The columns and their data types
print("\nColumns and their data types:")
print(df.dtypes)

# d. Detect and replace null values with mode (no null values in this synthetic data)
print("\nChecking for null values:")
print(df.isnull().sum())

# Let's manually insert some null values to demonstrate the replacement
df.loc[np.random.choice(df.index, 10, replace=False), 'Credit_Score'] = np.nan

print("\nNull values after manual insertion:")
print(df.isnull().sum())

# Replace null values with mode
for column in df.columns:
    mode_value = df[column].mode()[0]
    df[column].fillna(mode_value, inplace=True)

print("\nNull values after replacement:")
print(df.isnull().sum())

# e. Explore the dataset using a boxplot for Credit Scores based on Occupation
plt.figure(figsize=(10, 6))
sns.boxplot(x='Occupation', y='Credit_Score', data=df)
plt.title('Credit Scores Based on Occupation')
plt.xticks(rotation=45)
plt.show()

# f. Split the data into test and train
X = df.drop('Credit_Score', axis=1)
y = df['Credit_Score']

# Convert categorical variables to numeric
X = pd.get_dummies(X)

X_train, X_test, y_train, y_test = train_test_split(X, y, test_size=0.2, random_state=42)

# g. Fit into the model using Naive Bayes Classifier
model = GaussianNB()
model.fit(X_train, y_train)

# h. Predict the model and evaluate
y_pred = model.predict(X_test)
accuracy = accuracy_score(y_test, y_pred)

print("\nAccuracy of the Naive Bayes Classifier:")
print(accuracy)
