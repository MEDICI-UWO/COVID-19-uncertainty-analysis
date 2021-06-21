## Level 2 data extrapolation

library(dplyr)

# load data (IHME-GBD 2019, level 2 causes)
data <- read.csv('Data/Level 2/IHME-GBD_2019_DATA-level_2.csv', stringsAsFactors = FALSE)

# top 3 causes of death in the United States
causes <- c('Cardiovascular diseases', 'Neoplasms', 'Chronic respiratory diseases')

# Filter data set to only contain top 3 causes of deaths in the United States
united.states <- data %>%
  filter(location == 'United States of America', cause %in% causes)

# Go through each cause and create regression plot
for (c in causes) {
  temp <- united.states %>%
    filter(cause == c)
  plot(temp$year, temp$val, main = c, xlab = 'Year', ylab = 'Deaths')
  model <- lm(val~poly(year, degree = 3), data = temp)
  s <- summary(model)
  order_id <- order(temp$year)
  lines(x = temp$year[order_id], y = fitted(model)[order_id], col = 'red')
  text(2019, min(temp$val), bquote(R^2~"="~.(s$r.squared)), adj = c(0.8, NA))
}

