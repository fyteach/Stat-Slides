# Set a seed for reproducibility
set.seed(923)

# Generate two variables with a strong correlation (without outlier)
variable1 <- rnorm(100, 0, 2)
variable2 <- variable1 - mean(variable1) + rnorm(100, mean = 0, sd = 0.2)

# Create an outlier
outlier_index <- sample(1:100, 1)  # Randomly select one index
variable2[outlier_index] <- variable2[outlier_index] + 10  # Add an outlier value to variable2

# Calculate correlation without outlier
correlation_without_outlier <- cor(variable1, variable2)

# Create a data frame
df_without_outlier <- data.frame(Variable1 = variable1, Variable2 = variable2, Outlier = "No")

# Print correlation without outlier
cat("Correlation without outlier:", correlation_without_outlier, "\n")

# Create another set of variables with a weak correlation (with outlier)
variable1_weak <- rnorm(100)
variable2_weak <- 0.2 * variable1_weak + rnorm(100, mean = 0, sd = 0.2)

# Create a data frame with weak correlation
df_with_outlier <- data.frame(Variable1 = variable1_weak, Variable2 = variable2_weak, Outlier = "Yes")

# Check the first few rows of the data frames
head(df_without_outlier)
head(df_with_outlier)
