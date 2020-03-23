library(dplyr)

# Import data
data <- read.csv('Data/IHME-GBD_1990_2017_DATA.csv', stringsAsFactors = FALSE)

# Create dataframe for years we want to predict
df <- data.frame(year = c(2018, 2019, 2020))

# Function to predict value for given year in df
predict.value <- function(country.df, cause.string, degree, df) {
  # Inputs:
  #   country.df: Data frame of data from one particular country
  #   cause: String, cause of interest
  #   degree: Integer, degree of regression line
  #   df: Data frame of the year(s) that you want to predict the values of
  cause.df <- country.df %>%
    filter(cause == cause.string) %>%
    arrange(year)
  plot(cause.df$year, cause.df$val)
  reg <- lm(val~poly(year, degree = degree, raw = TRUE), data = cause.df)
  print(summary(reg))
  order_id <- order(cause.df$year)
  lines(x = cause.df$year[order_id], y = fitted(reg)[order_id], col = 'red')
  return(suppressWarnings(predict(object = reg, newdata = df)))
}

# Vectors to create new data frame with extrapolated data
Country <- c(rep('Canada', times = 9), rep('Italy', times = 9), rep('United States', times = 9), rep('China', times = 9))
Cause <- c()
Year <- rep(df$year, times = 12)
Val <- c()

## CANADA
Canada <- data %>% 
  filter(metric == 'Number', location == 'Canada')

p <- predict.value(Canada, 'Ischemic heart disease', 4, df)
# 1        2        3 
# 50219.33 52553.98 55287.88 
Cause <- append(Cause, rep('Ischemic heart disease', times = 3))
for (i in 1:length(p)) {
  Val <- append(Val, p[[i]])
}

p <- predict.value(Canada, "Alzheimer's disease and other dementias", 2, df)
# 1        2        3 
# 26020.49 26848.32 27697.67
Cause <- append(Cause, rep("Alzheimer's disease and other dementias", times = 3))
for (i in 1:length(p)) {
  Val <- append(Val, p[[i]])
}

p <- predict.value(Canada, 'Tracheal, bronchus, and lung cancer', 1, df)
# 1        2        3 
# 21711.42 21950.71 22190.00
Cause <- append(Cause, rep('Tracheal, bronchus, and lung cancer', times = 3))
for (i in 1:length(p)) {
  Val <- append(Val, p[[i]])
}

## ITALY
Italy <- data %>% 
  filter(metric == 'Number', location == 'Italy')

p <- predict.value(Italy, 'Ischemic heart disease', 4, df)
# 1         2         3 
# 98771.58 100358.92 102254.80 
Cause <- append(Cause, rep('Ischemic heart disease', times = 3))
for (i in 1:length(p)) {
  Val <- append(Val, p[[i]])
}

p <- predict.value(Italy, "Alzheimer's disease and other dementias", 1, df)
# 1        2        3 
# 74323.86 75794.15 77264.44 
Cause <- append(Cause, rep("Alzheimer's disease and other dementias", times = 3))
for (i in 1:length(p)) {
  Val <- append(Val, p[[i]])
}

p <- predict.value(Italy, 'Stroke', 4, df)
# 1        2        3 
# 61161.49 62478.23 64002.90
Cause <- append(Cause, rep('Ischemic stroke', times = 3))
for (i in 1:length(p)) {
  Val <- append(Val, p[[i]])
}

## USA
USA <- data %>% 
  filter(metric == 'Number', location == 'United States')

p <- predict.value(USA, 'Ischemic heart disease', 4, df)
# 1        2        3 
# 546097.0 566830.1 591717.0
Cause <- append(Cause, rep('Ischemic heart disease', times = 3))
for (i in 1:length(p)) {
  Val <- append(Val, p[[i]])
}

p <- predict.value(USA, "Alzheimer's disease and other dementias", 1, df)
# If using degree 1
# 1        2        3 
# 258038.5 262908.1 267777.7 
Cause <- append(Cause, rep("Alzheimer's disease and other dementias", times = 3))
for (i in 1:length(p)) {
  Val <- append(Val, p[[i]])
}

p <- predict.value(USA, 'Tracheal, bronchus, and lung cancer', 4, df)
# 1        2        3 
# 190198.1 194428.8 199286.3 
Cause <- append(Cause, rep('Tracheal, bronchus, and lung cancer', times = 3))
for (i in 1:length(p)) {
  Val <- append(Val, p[[i]])
}

## CHINA
China <- data %>% 
  filter(metric == 'Number', location == 'China')

p <- predict.value(China, 'Stroke', 2, df)
# 1       2       3 
# 2104847 2137927 2171212
Cause <- append(Cause, rep('Ischemic stroke', times = 3))
for (i in 1:length(p)) {
  Val <- append(Val, p[[i]])
}

p <- predict.value(China, 'Ischemic heart disease', 4, df)
# 1       2       3 
# 1825607 1868277 1906159
Cause <- append(Cause, rep('Ischemic heart disease', times = 3))
for (i in 1:length(p)) {
  Val <- append(Val, p[[i]])
}

p <- predict.value(China, 'Chronic obstructive pulmonary disease', 4, df)
# 1         2         3 
# 989958.6 1031532.6 1083034.2 
Cause <- append(Cause, rep('Chronic obstructive pulmonary disease', times = 3))
for (i in 1:length(p)) {
  Val <- append(Val, p[[i]])
}

# Create new data frame with extrapolated data
extrap.df = data.frame(Country = Country, Cause = Cause, Year = Year, Val = Val)
# Write to csv file
write.csv(extrap.df, 'Data/top3_extrapolation.csv')




