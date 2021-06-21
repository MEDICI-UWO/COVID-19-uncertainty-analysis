## Level 3 data extrapolation

library(dplyr)

# load data (IHME-GBD 2019, level 3 causes)
data1 <- read.csv('Data/Level 3/IHME-GBD_2019_DATA-level_3_1.csv', stringsAsFactors = FALSE)
data2 <- read.csv('Data/Level 3/IHME-GBD_2019_DATA-level_3_2.csv', stringsAsFactors = FALSE)
data <- rbind(data1, data2)
rm(data1, data2)

# top 4 causes of death in the United States (because stroke overtakes COPD in 2021)
causes <- c('Ischemic heart disease', 'Tracheal, bronchus, and lung cancer', 'Chronic obstructive pulmonary disease', 'Stroke')

# Filter data set to only contain top 4 causes of deaths in the United States
united.states <- data %>%
  filter(location == 'United States of America', cause %in% causes)

rm(data)

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

