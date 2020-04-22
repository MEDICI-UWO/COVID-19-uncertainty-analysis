library(dplyr)

# Import data
data1 <- read.csv("Data/IHME-GBD_2017_DATA-1.csv", stringsAsFactors = FALSE)
data2 <- read.csv("Data/IHME-GBD_2017_DATA-2.csv", stringsAsFactors = FALSE)

# Combine data sets
data <- rbind(data1, data2)

# Remove objects (to save space)
rm('data1', 'data2')

# Remove HIV/AIDS from data set
# Since the number of deaths due to HIv/AIDS are decreasing, we want to exclude this cause from the list of top 3 causes of death 
# (if we had extrapolated the data sets for HIV/AIDS, the estimated values for the year 2020 would be very small, even negative)
data <- data[data$cause != "HIV/AIDS", ]

# Filter data to get top three causes of death (based on the data from 2017)
parse.data <- data %>%
  filter(year == 2017) %>%
  group_by(location) %>%
  arrange(desc(val)) %>%
  top_n(3) %>%
  arrange(location, desc(val))

# Get country names
countries <- sort(unique(parse.data$location))

# Create data frame for the year that we want to estimate the value for (the year 2020)
predict.df <- data.frame(year = 2020)

# Create a matrix to store all the predicted values (this will eventually turn into our data frame that we will then export)
predict.matrix <- NULL

# Go through each country, fit the data of each causes of death (top 3 causes only) with a degree 3 polynomial, and predict the value for the year 2020
for (c in countries) {
  temp <- parse.data %>%
    filter(location == c)
  cause.list = temp$cause
  for (cl in cause.list) {
    temp <- data %>%
      filter(location == c, cause == cl)
    reg <- lm(val~poly(year, 3), data = temp)
    s <- summary(reg)
    p <- predict(object = reg, newdata = predict.df)
    # append the values to the matrix
    predict.matrix <- rbind(predict.matrix, c(c, cl, p))
  }
}

# Rename the columns of the matrix
colnames(predict.matrix) = c("location", "cause", "val")

# Convert the matrix to a data frame
prediction.df <- as.data.frame(predict.matrix, stringsAsFactors = FALSE)

# Sort the data frame according to country (alphabetically) and ranking of the cause of death
prediction.df <- prediction.df %>%
  arrange(location, desc(val))

write.csv(prediction.df, "Data/predict_values.csv")