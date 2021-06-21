# Level 3 data extrapolation

library(dplyr)

# Read and combine data (IHME-GBD 2019, level 3 causes)
data1 <- read.csv('Data/Level 3/IHME-GBD_2019_DATA-level_3_1.csv', stringsAsFactors = FALSE)
data2 <- read.csv('Data/Level 3/IHME-GBD_2019_DATA-level_3_2.csv', stringsAsFactors = FALSE)
data.large <- rbind(data1, data2)
rm(data1, data2)

# Get all country names
countries <- sort(unique(data.large$location))

# Since the data set is huge, we take the top 10 causes of death (in 2019) and filter the data to only include these causes
data <- NULL
for (c in countries) {
  temp <- data.large %>%
    filter(location == c, year == 2019) %>%
    top_n(n = 10, val)
  top.10.cause <- temp$cause
  temp <- data.large %>%
    filter(location == c, cause %in% top.10.cause)
  data <- rbind(data, temp)
}

# Remove the huge data set (to save memory)
rm(data.large)

# Create a new data frame to store extrapolated data (note here, causes is NA because each country would have different top 10 causes of death)
new.data <- data.frame(
  location = rep(countries, each = 10*2),
  cause = NA,
  year = rep(c(2020, 2021), length(countries)*10),
  val = NA
)

# Iterate through each country to predict the number of deaths for each cause of death for 2020 and 2021
for (c in countries) {
  # Since each country has a different set of causes of deaths, we first filter the data set to get the top 10 causes
  temp.large <- data %>%
    filter(location == c)
  causes <- unique(temp.large$cause)
  new.data$cause[new.data$location == c] <- rep(causes, each = 2)
  # Iterate through each causes (within the country) and extrapolate (using cubic regression) the number of deaths that would occur in 2020 and 2021 for each cause
  for (ca in causes) {
    temp <- temp.large %>%
      filter(location == c, cause == ca)
    model <- lm(val~poly(year, 3), data = temp)
    new.data$val[new.data$location == c & new.data$cause == ca] <- predict(model, new.data[new.data$location == c & new.data$cause == ca, ])
  }
}

# Filter extrapolated data frame to only include top three causes for each country, per year
top.3 <- new.data %>%
  group_by(location, year) %>%
  top_n(n = 3) %>%
  arrange(desc(val), .by_group=TRUE)

# Write to file
write.csv(top.3, "Predicted Values/level3_extrapolation.csv", row.names = FALSE)
