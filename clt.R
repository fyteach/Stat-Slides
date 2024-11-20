# population <- c(0,1)


# N <- 10000 ## Number of simulations to run
# n <- 50 ## Sample size
# means <- numeric(N) ## Setting up an empty vector
# for (i in 1:N){
#   samples <- sample(population, n, replace = TRUE)
#   means[i] <- mean(samples)
# }

# SD <- sd(population)
# SE <- SD/sqrt(n)
# sd(means)

# hist(means, col="gray", border="white")

library(ggplot2)
# library(plotly)

temperature <- c(
  96.9,96.9,97,97.4,97.5,97.5,97.6,97.7,97.8,97.8,97.9,98,98,98.1,98.2,98.2,98.2,98.3,98.5,98.6
)

minimum <- 96.9
q1 <- 97.5
median_val <- 97.85
q3 <- 98.2
maximum <- 98.6

# Create the ggplot with color
p <- ggplot(data = data.frame(temperature = temperature), aes(x = "", y = temperature)) +
  geom_boxplot(
    outlier.size = 5,
    ymin = minimum,
    lower = q1,
    middle = median_val,
    upper =  q3,
    ymax = maximum,
    fill = "lightblue"  # Set the fill color
  ) +
  scale_y_continuous(breaks = c(96.9, 97.5, 97.85, 98.2, 98.6)) +
  theme_classic(base_size = 16) +
  xlab("") +
  coord_flip() +
  theme(
    axis.line.x = element_line(linewidth = 1.2),
    axis.line.y = element_blank(),
    axis.ticks.y = element_blank(),
    axis.text.y = element_blank(),
    axis.text.x = element_text(size = 14),  # Adjust the size of x-axis ticks

    # Adjust the plot margins to crop white space
    plot.margin = margin(0.2, 0.2, 0.2, 0.2, "cm")  # Adjust margins as needed
  )

# Add vertical bars at the ends of whiskers and labels for the five-number summary
p +
  geom_segment(
    aes(x = -0.5, xend = 0.5, y = minimum, yend=minimum),
    color = "red",
    size = 1
  ) +
  geom_segment(
    aes(x = -0.5, xend = 0.5, y = maximum, yend=maximum),
    color = "red",
    size = 1
  ) +
  geom_text(
    aes(x = 0, y = minimum - 0.2, label = minimum),
    hjust = 0.5,
    color = "red",
    size = 5
  ) +
  geom_text(
    aes(x = 0, y = q1, label = q1),
    hjust = -0.5,
    color = "red",
    size = 5
  ) +
  geom_text(
    aes(x = 0, y = median_val, label = median_val),
    hjust = -0.5,
    color = "red",
    size = 5
  ) +
  geom_text(
    aes(x = 0, y = q3, label = q3),
    hjust = -0.5,
    color = "red",
    size = 5
  ) +
  geom_text(
    aes(x = 0, y = maximum + 0.2, label = maximum),
    hjust = 0.5,
    color = "red",
    size = 5
  )

# plotlyboxplot <- ggplotly(boxplot1)
# htmlwidgets::saveWidget(plotlyboxplot, "boxplot1.html", selfcontained=TRUE)

p
