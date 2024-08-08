import pandas as pd
import numpy as np
from sklearn.datasets import load_breast_cancer
from sklearn.model_selection import train_test_split
from sklearn.naive_bayes import GaussianNB
from sklearn.metrics import confusion_matrix, classification_report

# a) Load the breast cancer dataset and print the first five rows
cancer = load_breast_cancer()
df = pd.DataFrame(data=cancer.data, columns=cancer.feature_names)
df['target'] = cancer.target

print("First five rows of the dataset:")
print(df.head())

# b) Basic statistical computations on the dataset
print("\nBasic statistical computations:")
print(df.describe())

# c) Print the columns and their data types
print("\nColumns and their data types:")
print(df.dtypes)

# d) Detect and replace null values with mode value
print("\nChecking for null values:")
print(df.isnull().sum())

# For demonstration, let's assume there are some null values in the dataset
# Here, we'll manually insert some null values to demonstrate the replacement
df.loc[np.random.choice(df.index, 5, replace=False), 'mean radius'] = np.nan
print("\nNull values after manual insertion:")
print(df.isnull().sum())

# Replace null values with mode
for column in df.columns:
    mode_value = df[column].mode()[0]
    df[column].fillna(mode_value, inplace=True)

print("\nNull values after replacement:")
print(df.isnull().sum())

# e) Split the data into training and test sets
X = df.drop('target', axis=1)
y = df['target']

X_train, X_test, y_train, y_test = train_test_split(X, y, test_size=0.2, random_state=42)

# f) Train a Naive Bayes classifier and evaluate the performance
model = GaussianNB()
model.fit(X_train, y_train)

# Predict the test set
y_pred = model.predict(X_test)

# Evaluate the performance
conf_matrix = confusion_matrix(y_test, y_pred)
class_report = classification_report(y_test, y_pred)

print("\nConfusion Matrix:")
print(conf_matrix)

print("\nClassification Report:")
print(class_report)
