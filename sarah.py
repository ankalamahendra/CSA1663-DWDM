import pandas as pd
import numpy as np
import matplotlib.pyplot as plt
import seaborn as sns
from sklearn.model_selection import train_test_split
from sklearn.naive_bayes import GaussianNB
from sklearn.metrics import accuracy_score

# a) Read the IRIS.csv Data set using the Pandas module
from sklearn.datasets import load_iris

# Load Iris dataset from sklearn
iris = load_iris()
df = pd.DataFrame(data=iris.data, columns=iris.feature_names)
df['species'] = pd.Categorical.from_codes(iris.target, iris.target_names)

print("First five rows of the dataset:")
print(df.head())

# b) Plot the data using a scatter plot "sepal_width" versus "sepal_length" and color by species
plt.figure(figsize=(10, 6))
sns.scatterplot(x='sepal length (cm)', y='sepal width (cm)', hue='species', data=df, palette='viridis')
plt.title('Sepal Width vs Sepal Length')
plt.show()

# c) Split the data
X = df.drop('species', axis=1)
y = df['species']

X_train, X_test, y_train, y_test = train_test_split(X, y, test_size=0.2, random_state=42)

# d) Fit the data to the model
model = GaussianNB()
model.fit(X_train, y_train)

# Evaluate the model
y_pred = model.predict(X_test)
accuracy = accuracy_score(y_test, y_pred)
print(f"Accuracy of the model: {accuracy}")

# e) Predict the model with new test data [5, 3, 1, .3]
new_sample = np.array([[5, 3, 1, 0.3]])
predicted_species = model.predict(new_sample)
print(f"Predicted species for new sample [5, 3, 1, .3]: {predicted_species[0]}")
