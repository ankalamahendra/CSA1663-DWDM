import pandas as pd
import numpy as np
import seaborn as sns
import matplotlib.pyplot as plt
from sklearn.model_selection import train_test_split
from sklearn.linear_model import LinearRegression
from sklearn.metrics import mean_squared_error, r2_score

# a) Read the house dataset using the Pandas module
# For this example, let's create a sample dataset
data = {
    'Size': [1500, 1600, 1700, 1800, 1900, 2000, 2100, 2200, 2300, 2400],
    'Bedrooms': [3, 3, 3, 4, 4, 4, 4, 5, 5, 5],
    'Age': [10, 15, 20, 10, 15, 20, 10, 15, 20, 10],
    'Price': [300000, 320000, 340000, 360000, 380000, 400000, 420000, 440000, 460000, 480000]
}
df = pd.DataFrame(data)

# b) Print the first five rows
print("First five rows of the dataset:")
print(df.head())

# c) Basic statistical computations on the dataset
print("\nBasic statistical computations:")
print(df.describe())

# d) Print the columns and their data types
print("\nColumns and their data types:")
print(df.dtypes)

# e) Detect and replace null values with mode value (no null values in this sample data)
print("\nChecking for null values:")
print(df.isnull().sum())

# Let's manually insert some null values to demonstrate the replacement
df.loc[np.random.choice(df.index, 2, replace=False), 'Bedrooms'] = np.nan
print("\nNull values after manual insertion:")
print(df.isnull().sum())

# Replace null values with mode
for column in df.columns:
    mode_value = df[column].mode()[0]
    df[column].fillna(mode_value, inplace=True)

print("\nNull values after replacement:")
print(df.isnull().sum())

# f) Explore the dataset using a heatmap
plt.figure(figsize=(10, 6))
sns.heatmap(df.corr(), annot=True, cmap='coolwarm')
plt.title('Heatmap of Correlation Matrix')
plt.show()

# g) Split the data into training and test sets
X = df.drop('Price', axis=1)
y = df['Price']

X_train, X_test, y_train, y_test = train_test_split(X, y, test_size=0.2, random_state=42)

# h) Predict the price of a house using a linear regression model
model = LinearRegression()
model.fit(X_train, y_train)

# Predict the test set
y_pred = model.predict(X_test)

# Evaluate the model
mse = mean_squared_error(y_test, y_pred)
r2 = r2_score(y_test, y_pred)
print(f"\nMean Squared Error: {mse}")
print(f"R^2 Score: {r2}")

# Predict the price of a new house
new_house = np.array([[2000, 4, 15]])  # Example: 2000 sqft, 4 bedrooms, 15 years old
predicted_price = model.predict(new_house)
print(f"Predicted price for the new house [2000 sqft, 4 bedrooms, 15 years old]: ${predicted_price[0]:,.2f}")
