library(ggplot2)

temperature <- c(
  96.5, 96.8, 96.8, 96.9, 96.9, 97, 97.2, 97.3, 97.3, 97.4,
  97.5, 97.5, 97.6, 97.8, 98, 98.1, 98.2, 98.2, 98.2, 98.3,
  98.5, 98.5, 98.8, 98.8, 98.9
)

# Calculate quartile values manually
minimum <- 96.5
q1 <- 97.1
median_val <- 97.6
q3 <- 98.25
maximum <- 98.9

# Create the ggplot
p <- ggplot(data = data.frame(temperature = temperature), aes(x = "", y = temperature)) +
  geom_boxplot(
    outlier.size = 5,
    ymin = minimum,
    lower = q1,
    middle = median_val,
    upper =  q3,
    ymax = maximum,
    fill = "cadetblue1",
    color = "blue"
  ) +
  scale_y_continuous(breaks = c(96.5, 97.1, 97.6, 98.25, 98.9)) +
  theme_classic(base_size = 12) +
  xlab("") +
  ylab("Temperature") +
  coord_flip() +
  theme(
    axis.line.x = element_line(linewidth = 1.2),
    axis.line.y = element_blank(),
    axis.ticks.y = element_blank(),
    axis.text.y = element_blank(),
    axis.text.x = element_text(size = 14),
    plot.margin = margin(0, 0, 0, 0, "cm")
  )

# Add vertical bars at the ends of whiskers
p +
  geom_segment(
    aes(x = 0.95, xend = 1.05, y = minimum, yend = minimum),
    size = 1,
    color = "blue"
  ) +
  geom_segment(
    aes(x = 0.95, xend = 1.05, y = maximum, yend = maximum),
    size = 1,
    color = "blue"
  )# +
  # Add text labels for the five-number summary
  # geom_text(
  #   aes(x = 1, y = minimum, label = minimum),
  #   vjust = 3,
  #   size = 5
  # ) +
  # geom_text(
  #   aes(x = 1, y = q1, label = q1),
  #   vjust = 3,
  #   size = 5
  # ) +
  # geom_text(
  #   aes(x = 1, y = median_val, label = median_val),
  #   vjust = 3,
  #   size = 5
  # ) +
  # geom_text(
  #   aes(x = 1, y = q3, label = q3),
  #   vjust = 3,
  #   size = 5
  # ) +
  # geom_text(
  #   aes(x = 1, y = maximum, label = maximum),
  #   vjust = 3,
  #   size = 5
  # )

