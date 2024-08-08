import numpy as np
import matplotlib.pyplot as plt
from scipy.stats import norm

# Generate sample data
np.random.seed(42)
data = np.concatenate([np.random.normal(0, 1, 100), np.random.normal(5, 2, 100)])

# Plot the data
plt.hist(data, bins=30, density=True, alpha=0.6, color='g')
plt.title("Histogram of the sample data")
plt.show()

# Number of Gaussians
k = 2

# Initialize the parameters
means = np.random.choice(data, k)
variances = np.random.random(k) + 1
mixing_coefficients = np.ones(k) / k

# EM algorithm
def em_algorithm(data, means, variances, mixing_coefficients, max_iter=100):
    n = len(data)
    k = len(means)

    for _ in range(max_iter):
        # E-step: Calculate responsibilities
        responsibilities = np.zeros((n, k))
        for i in range(k):
            responsibilities[:, i] = mixing_coefficients[i] * norm.pdf(data, means[i], np.sqrt(variances[i]))
        responsibilities /= responsibilities.sum(axis=1, keepdims=True)

        # M-step: Update parameters
        N_k = responsibilities.sum(axis=0)
        means = np.sum(responsibilities * data[:, np.newaxis], axis=0) / N_k
        variances = np.sum(responsibilities * (data[:, np.newaxis] - means)**2, axis=0) / N_k
        mixing_coefficients = N_k / n

    return means, variances, mixing_coefficients

# Run the EM algorithm
means, variances, mixing_coefficients = em_algorithm(data, means, variances, mixing_coefficients)

print("Estimated means:", means)
print("Estimated variances:", variances)
print("Estimated mixing coefficients:", mixing_coefficients)

# Plot the fitted Gaussians
x = np.linspace(min(data), max(data), 1000)
fitted_gaussians = np.zeros_like(x)
for i in range(k):
    fitted_gaussians += mixing_coefficients[i] * norm.pdf(x, means[i], np.sqrt(variances[i]))

plt.hist(data, bins=30, density=True, alpha=0.6, color='g')
plt.plot(x, fitted_gaussians, color='r')
plt.title("Fitted Gaussian Mixture Model")
plt.show()
