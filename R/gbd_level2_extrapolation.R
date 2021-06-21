## Level 2 data extrapolation

library(dplyr)

# load data (IHME-GBD 2019, level 2 causes)
data <- read.csv('Data/Level 2/IHME-GBD_2019_DATA-level_2.csv', stringsAsFactors = FALSE)

# get all countries and causes
countries <- sort(unique(data$location))
causes <- sort(unique(data$cause))

# create data frame to store extrapolated values (to estimate number of deaths due to each cause in 2020 and 2021)
new.data <- data.frame(
  location = rep(countries, each = length(causes)*2),
  cause = rep(rep(causes, each = 2), length(countries)),
  year = rep(c(2020, 2021), length(countries)*length(causes)),
  val = NA
)

# Go through each country and cause and run a cubic regression to predict number of deaths for each cause
for (c in countries) {
  for (ca in causes) {
    temp <- data %>%
      filter(location == c, cause == ca)
    model <- lm(val~poly(year, 3), data = temp)
    new.data$val[new.data$location == c & new.data$cause == ca] <- predict(model, new.data[new.data$location == c & new.data$cause == ca, ])
  }
}

# Filter data frame to include the 3 leading causes of deaths, per country, per year
top.3 <- new.data %>%
  group_by(location, year) %>%
  top_n(n = 3) %>%
  arrange(desc(val), .by_group=TRUE)

# Write to file
write.csv(top.3, "Predicted Values/level2_extrapolation.csv", row.names = FALSE)
