population <- c(0,1)


N <- 10000 ## Number of simulations to run
n <- 50 ## Sample size
means <- numeric(N) ## Setting up an empty vector
for (i in 1:N){
  samples <- sample(population, n, replace = TRUE)
  means[i] <- mean(samples)
}

SD <- sd(population)
SE <- SD/sqrt(n)
sd(means)

hist(means, col="gray", border="white")
