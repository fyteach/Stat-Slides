library(ggplot2)
library(plyr)

quiz <- c(5,7,9,9,8,7,9,4,9,8,2,3,8,9,10,8,7,10,6,5)

# Find the max frequency
yheightPL <- max(count(quiz)$freq)

# Create a basic dotplot
dotchart <- ggplot(data = data.frame(quiz = quiz), aes(x = quiz)) +
  geom_dotplot(binwidth = 1, method = "histodot", dotsize = 0.6, fill = "blue") +

  # Set up the right y-axis height
  coord_fixed(ratio = 1 * 0.6 * yheightPL) +

  # Customize the theme
  theme_bw() +
  theme(
    panel.background = element_blank(),
    panel.border = element_blank(),
    panel.grid.minor = element_blank(),
    axis.line = element_line(colour = "black"),
    axis.line.y = element_blank(),
  ) +

  # Add more tick marks on the x-axis
  scale_x_continuous(breaks = seq(1, 10, 1)) +

  # Add tick marks on the y-axis to reflect frequencies
  scale_y_continuous(
    limits = c(0, 1),
    expand = c(0, 0),
    breaks = seq(0, 1, 1/yheightPL),
    labels = seq(0, yheightPL)
  ) +

  # Remove x and y labels
  labs(x = NULL, y = NULL)

# Define a custom function to remove vertical grid lines
removeGridX <- function() {
  theme(
    panel.grid.major.x = element_blank(),
    panel.grid.minor.x = element_blank()
  )
}

# Apply the removeGridX function to remove vertical grid lines
dotchart + removeGridX()
