library(ggplot2)

temperature <- c(
  96.9, 96.9, 97.0, 97.4, 97.5, 97.5, 97.6, 97.7, 97.8, 97.8,
  97.9, 98.0, 98.0, 98.1, 98.2, 98.2, 98.2, 98.3, 98.5, 98.6
)

# Calculate quartile values manually
minimum <- 96.9
q1 <- 97.5
median_val <- 97.85
q3 <- 98.2
maximum <- 98.6

# Create the ggplot
p <- ggplot(data = data.frame(temperature = temperature), aes(x = "", y = temperature)) +
  geom_boxplot(
    # outlier.size = 5,
    ymin = minimum,
    lower = q1,
    middle = median_val,
    upper =  q3,
    ymax = maximum,
    fill = "cadetblue1",
    color = "blue"
  ) +
  scale_y_continuous(breaks = c(96.9, 97.5, 97.85, 98.2, 98.6)) +
  theme_classic(base_size = 10) +
  xlab("") +
  ylab("Temperature") +
  coord_flip() +
  theme(
    axis.line.y = element_blank(),
    axis.ticks.y = element_blank(),
    axis.text.y = element_blank(),
    axis.text.x = element_text(size = 12),
    axis.title.x = element_text(size = 12.5, face="bold", vjust = 1),
    plot.margin = margin(0, 0, 0, 0, "cm")
  ) +
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

p + ggtitle('Boxplot for Boday Temperature') +  theme(plot.title = element_text(size = 16, hjust = 0.5, vjust = -4, face="bold"))
