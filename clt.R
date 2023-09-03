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
library(plotly)

load("Data-Frames-SUNY-Concepts-in-Statistics/actor.rdata")

boxplot1<-ggplot(actor_age, aes(x="", y=Age)) +
  # stat_boxplot(geom = "errorbar") +
  geom_boxplot(outlier.size=5) +
  scale_y_continuous(breaks = c(31, 37.5, 42.5, 49.5, 61, 76)) +
  theme_classic(base_size = 16) +
  xlab("") + 
  coord_flip() +
  theme(# panel.border=element_blank(), 
        axis.line.x = element_line(size = 1.2),
        axis.line.y = element_blank(),
        axis.ticks.y = element_blank(),
        axis.text.y = element_blank()
        )

plotlyboxplot <- ggplotly(boxplot1)
htmlwidgets::saveWidget(plotlyboxplot, "boxplot1.html", selfcontained=TRUE)
