# Set a seed for reproducibility
set.seed(923)

# Generate two random variables
variable1 <- rnorm(100, 0, 1.5)  # Generating 100 random values from a standard normal distribution
variable2 <- 1 * (variable1 - mean(variable1)) + rnorm(100, mean = 0, sd = 0.5)  # Creating a second variable with some correlation with the first

variable3 <- variable2

outlier_index <- sample(1:100, 1)  # Randomly select one index
variable3[outlier_index] <- variable3[outlier_index] + 12

# Check the correlation coefficient between the variables
correlation_coefficient1 <- cor(variable1[-outlier_index], variable2[-outlier_index])
cat("Correlation coefficient without outlier:", correlation_coefficient1, "\n")

correlation_coefficient2 <- cor(variable1, variable3)
cat("Correlation coefficient with outlier:", correlation_coefficient2, "\n")
