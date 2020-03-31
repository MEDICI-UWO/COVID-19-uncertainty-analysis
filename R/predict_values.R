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
  plot(cause.df$year, cause.df$val, xlab = 'Year', ylab = cause.string)
  reg <- lm(val~poly(year, degree = degree, raw = TRUE), data = cause.df)
  s <- summary(reg)
  order_id <- order(cause.df$year)
  lines(x = cause.df$year[order_id], y = fitted(reg)[order_id], col = 'red')
  text(2017, min(cause.df$val), bquote(R^2~"="~.(s$r.squared)), adj = c(0.5, NA))
  return(suppressWarnings(predict(object = reg, newdata = df)))
}

# Function to get top 3 causes of death from Country data frame
get.top3.causes <- function(country.df) {
  top3 <- country.df %>%
    filter(year == 2017) %>%
    arrange(desc(val)) %>%
    top_n(3)
  top3 <- top3$cause
  return(top3)
}

# Vectors to create new data frame with extrapolated data
Country <- c(rep('Canada', times = 9), rep('Italy', times = 9), rep('United States', times = 9), rep('China', times = 9), rep('Spain', times = 9), rep('United Kingdom', times = 9))
Cause <- NULL
Year <- rep(df$year, times = 18)
Val <- NULL

## CANADA
Canada <- data %>% 
  filter(metric == 'Number', location == 'Canada')

Canada.top3 <- get.top3.causes(Canada)

p <- predict.value(Canada, Canada.top3[1], 4, df)
# 1        2        3 
# 50219.33 52553.98 55287.88 
Cause <- append(Cause, rep(Canada.top3[1], times = 3))
Val <- append(Val, p)

p <- predict.value(Canada, Canada.top3[2], 2, df)
# 1        2        3 
# 26020.49 26848.32 27697.67
Cause <- append(Cause, rep(Canada.top3[2], times = 3))
Val <- append(Val, p)

p <- predict.value(Canada, Canada.top3[3], 1, df)
# 1        2        3 
# 21711.42 21950.71 22190.00
Cause <- append(Cause, rep(Canada.top3[3], times = 3))
Val <- append(Val, p)

## ITALY
Italy <- data %>% 
  filter(metric == 'Number', location == 'Italy')
Italy.top3 <- get.top3.causes(Italy)

p <- predict.value(Italy, Italy.top3[1], 4, df)
# 1         2         3 
# 98771.58 100358.92 102254.80 
Cause <- append(Cause, rep(Italy.top3[1], times = 3))
Val <- append(Val, p)

p <- predict.value(Italy, Italy.top3[2], 1, df)
# 1        2        3 
# 74323.86 75794.15 77264.44 
Cause <- append(Cause, rep(Italy.top3[2], times = 3))
Val <- append(Val, p)

p <- predict.value(Italy, Italy.top3[3], 4, df)
# 1        2        3 
# 61161.49 62478.23 64002.90
Cause <- append(Cause, rep(Italy.top3[3], times = 3))
Val <- append(Val, p)

## USA
USA <- data %>% 
  filter(metric == 'Number', location == 'United States')
USA.top3 <- get.top3.causes(USA)

p <- predict.value(USA, USA.top3[1], 4, df)
# 1        2        3 
# 546097.0 566830.1 591717.0
Cause <- append(Cause, rep(USA.top3[1], times = 3))
Val <- append(Val, p)

p <- predict.value(USA, USA.top3[2], 1, df)
# If using degree 1
# 1        2        3 
# 258038.5 262908.1 267777.7 
Cause <- append(Cause, rep(USA.top3[2], times = 3))
Val <- append(Val, p)

p <- predict.value(USA, USA.top3[3], 4, df)
# 1        2        3 
# 190198.1 194428.8 199286.3 
Cause <- append(Cause, rep(USA.top3[3], times = 3))
Val <- append(Val, p)

## CHINA
China <- data %>% 
  filter(metric == 'Number', location == 'China')
China.top3 <- get.top3.causes(China)

p <- predict.value(China, China.top3[1], 2, df)
# 1       2       3 
# 2104847 2137927 2171212
Cause <- append(Cause, rep(China.top3[1], times = 3))
Val <- append(Val, p)

p <- predict.value(China, China.top3[2], 4, df)
# 1       2       3 
# 1825607 1868277 1906159
Cause <- append(Cause, rep(China.top3[2], times = 3))
Val <- append(Val, p)

p <- predict.value(China, China.top3[3], 4, df)
# 1         2         3 
# 989958.6 1031532.6 1083034.2 
Cause <- append(Cause, rep(China.top3[3], times = 3))
Val <- append(Val, p)

## SPAIN
Spain <- data %>% 
  filter(metric == 'Number', location == 'Spain')
Spain.top3 <- get.top3.causes(Spain)

p <- predict.value(Spain, Spain.top3[1], 2, df)

Cause <- append(Cause, rep(Spain.top3[1], times = 3))
Val <- append(Val, p)

p <- predict.value(Spain, Spain.top3[2], 1, df)

Cause <- append(Cause, rep(Spain.top3[2], times = 3))
Val <- append(Val, p)

p <- predict.value(Spain, Spain.top3[3], 4, df)

Cause <- append(Cause, rep(Spain.top3[3], times = 3))
Val <- append(Val, p)

## UNITED KINGDOM
UK <- data %>% 
  filter(metric == 'Number', location == 'United Kingdom')
UK.top3 <- get.top3.causes(UK)

p <- predict.value(UK, UK.top3[1], 4, df)

Cause <- append(Cause, rep(UK.top3[1], times = 3))
Val <- append(Val, p)

p <- predict.value(UK, UK.top3[2], 2, df)

Cause <- append(Cause, rep(UK.top3[2], times = 3))
Val <- append(Val, p)

p <- predict.value(UK, UK.top3[3], 4, df)
 
Cause <- append(Cause, rep(UK.top3[3], times = 3))
Val <- append(Val, p)

names(Val) <- NULL

# Create new data frame with extrapolated data
extrap.df = data.frame(Country = Country, Cause = Cause, Year = Year, Val = Val)

# Write to csv file
write.csv(extrap.df, 'Data/top3_extrapolation.csv')




