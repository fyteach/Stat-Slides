library(ggplot2)
library(plyr)

quiz <- c(5,	1,	3,	3,	8,	7,	3,	4,	3,	2, 2,	3,	2,	9,	1, 8,	6,	6,	10,	7)

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
  labs(x = "Quiz Scores", y = NULL)

# Define a custom function to remove vertical grid lines
removeGridX <- function() {
  theme(
    panel.grid.major.x = element_blank(),
    panel.grid.minor.x = element_blank()
  )
}

# Apply the removeGridX function to remove vertical grid lines
dotchart +
  removeGridX() +
  ggtitle('Dotplot for Quizzes') +
  theme(plot.title = element_text(size = 16, hjust = 0.5, vjust = 8, face="bold"),
        axis.title.x = element_text(vjust = -5, face="bold"))
