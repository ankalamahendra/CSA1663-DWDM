import numpy as np
import pandas as pd
from sklearn.model_selection import train_test_split
from sklearn.metrics import accuracy_score

# Example dataset
data = {
    'feature1': [2.7810836, 1.465489372, 3.396561688, 1.38807019, 3.06407232, 7.627531214, 5.332441248, 6.922596716, 8.675418651, 7.673756466],
    'feature2': [2.550537003, 2.362125076, 4.400293529, 1.850220317, 3.005305973, 2.759262235, 2.088626775, 1.77106367, -0.242068655, 3.508563011],
    'label': [0, 0, 0, 0, 0, 1, 1, 1, 1, 1]
}

df = pd.DataFrame(data)

# Split the data into features and labels
X = df[['feature1', 'feature2']].values
y = df['label'].values

# Split the data into training and test sets
X_train, X_test, y_train, y_test = train_test_split(X, y, test_size=0.2, random_state=42)

# Helper functions
def calculate_mean_std(X):
    mean = np.mean(X, axis=0)
    std = np.std(X, axis=0)
    return mean, std

def calculate_prior(y):
    classes, counts = np.unique(y, return_counts=True)
    prior = counts / len(y)
    return dict(zip(classes, prior))

def calculate_likelihood(X, mean, std):
    exponent = np.exp(-((X - mean) ** 2 / (2 * std ** 2)))
    likelihood = (1 / (np.sqrt(2 * np.pi) * std)) * exponent
    return likelihood

def gaussian_naive_bayes_predict(X, mean_std, priors):
    predictions = []
    for x in X:
        posteriors = []
        for c in priors.keys():
            mean, std = mean_std[c]
            prior = priors[c]
            likelihood = calculate_likelihood(x, mean, std)
            posterior = np.prod(likelihood) * prior
            posteriors.append(posterior)
        predictions.append(np.argmax(posteriors))
    return predictions

# Train the Gaussian Naive Bayes model
mean_std = {}
priors = calculate_prior(y_train)
for c in np.unique(y_train):
    X_c = X_train[y_train == c]
    mean_std[c] = calculate_mean_std(X_c)

# Predict the test set
y_pred = gaussian_naive_bayes_predict(X_test, mean_std, priors)

# Evaluate the model
accuracy = accuracy_score(y_test, y_pred)
print(f"Accuracy: {accuracy}")
print(f"Predicted labels: {y_pred}")
print(f"Actual labels: {y_test.tolist()}")

# Predict a new sample [5, 3]
new_sample = np.array([[5, 3]])
new_pred = gaussian_naive_bayes_predict(new_sample, mean_std, priors)
print(f"Predicted label for new sample [5, 3]: {new_pred[0]}")
