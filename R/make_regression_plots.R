library(dplyr)

# Import data
data <- read.csv('Data/IHME-GBD_1990_2017_DATA.csv', stringsAsFactors = FALSE)

# Create dataframe for years we want to predict (in this case, we want to predict values for the year 2020, only)
df <- data.frame(year = c(2020))

# Function to plot and predict value for given year in df
predict.value <- function(country.df, cause.string, degree, df) {
  # Inputs:
  #   country.df: Data frame of data from one particular country
  #   cause: String, cause of interest
  #   degree: Integer, degree of regression line
  #   df: Data frame of the year(s) that you want to predict the values of
  cause.df <- country.df %>%
    filter(cause == cause.string) %>%
    arrange(year)
  plot(cause.df$year, cause.df$val, main = cause.string, xlab = 'Year', ylab = 'Number of Deaths')
  reg <- lm(val~poly(year, degree = degree), data = cause.df)
  s <- summary(reg)
  order_id <- order(cause.df$year)
  lines(x = cause.df$year[order_id], y = fitted(reg)[order_id], col = 'red')
  text(2017, min(cause.df$val), bquote(R^2~"="~.(s$r.squared)), adj = c(0.8, NA))
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

## CANADA
Canada <- data %>% 
  filter(metric == 'Number', location == 'Canada')
Canada.top3 <- get.top3.causes(Canada)

# Regression plot (degree 3) for ischemic heart disease
predict.value(Canada, Canada.top3[1], 3, df)

# Regression plot (degree 3) for Alzheimer's disease and other dementias
predict.value(Canada, Canada.top3[2], 3, df)

# Regression plot (degree 3) for tracheal, bronchus, and lung cancer
predict.value(Canada, Canada.top3[3], 3, df)

## ITALY
Italy <- data %>% 
  filter(metric == 'Number', location == 'Italy')
Italy.top3 <- get.top3.causes(Italy)

# Regression plot (degree 3) for ischemic heart disease
predict.value(Italy, Italy.top3[1], 3, df)

# Regression plot (degree 3) for Alzheimer's disease and other dementias
predict.value(Italy, Italy.top3[2], 3, df)

# Regression plot (degree 3) for stroke
predict.value(Italy, Italy.top3[3], 3, df)

## USA
USA <- data %>% 
  filter(metric == 'Number', location == 'United States')
USA.top3 <- get.top3.causes(USA)

# Regression plot (degree 3) for ischemic heart disease
predict.value(USA, USA.top3[1], 3, df)

# Regression plot (degree 3) for Alzheimer's disease and other dementias
predict.value(USA, USA.top3[2], 3, df)

# Regression plot (degree 3) for tracheal, bronchus, and lung cancer
predict.value(USA, USA.top3[3], 3, df)

## CHINA
China <- data %>% 
  filter(metric == 'Number', location == 'China')
China.top3 <- get.top3.causes(China)

# Regression plot (degree 3) for stroke
predict.value(China, China.top3[1], 3, df)

# Regression plot (degree 3) for ischemic heart disease
predict.value(China, China.top3[2], 3, df)

# Regression plot (degree 3) for chronic obstructive pulmonary disease
predict.value(China, China.top3[3], 3, df)

## SPAIN
Spain <- data %>% 
  filter(metric == 'Number', location == 'Spain')
Spain.top3 <- get.top3.causes(Spain)

# Regression plot (degree 3) for ischemic heart disease
predict.value(Spain, Spain.top3[1], 3, df)

# Regression plot (degree 3) for Alzheimer's disease and other dementias
predict.value(Spain, Spain.top3[2], 3, df)

# Regression plot (degree 3) for stroke
predict.value(Spain, Spain.top3[3], 3, df)

## UNITED KINGDOM
UK <- data %>% 
  filter(metric == 'Number', location == 'United Kingdom')
UK.top3 <- get.top3.causes(UK)

# Regression plot (degree 3) for ischemic heart disease
predict.value(UK, UK.top3[1], 3, df)

# Regression plot (degree 3) for Alzheimer's disease and other dementias
predict.value(UK, UK.top3[2], 3, df)

# Regression plot (degree 3) for stroke
predict.value(UK, UK.top3[3], 3, df)