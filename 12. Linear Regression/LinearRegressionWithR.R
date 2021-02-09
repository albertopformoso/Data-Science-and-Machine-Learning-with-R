library(ggplot2)
library(ggthemes)
library(plotly)
library(dplyr)
library(corrgram)
library(corrplot)

df <- read.csv('12. Linear Regression/student-mat.csv', sep = ';')

print(
  any(is.na(df))
)

# Numeric columns only

num.cols <- sapply(df, is.numeric)

# filter (correlation)
cor.data <- cor(df[,num.cols])

# print(corrplot(cor.data), method = 'color')
# print(corrgram(df))
# 
# pl <- ggplot(df, aes(x=G3)) + geom_histogram(bins=20,
#                                              alpha=.5,
#                                              fill='blue')
# gpl <- ggplotly(pl)
# print(gpl)


# Split Data into Train and Test Set
library(caTools)

set.seed(101) # Set a seed

sample <- sample.split(df$G3, SplitRatio=0.7) # Column to predict

train <- subset(df, sample == T) # 70% of my data goes to training
test <- subset(df, sample == F) # 30% will be test

# Train and build model
model <- lm(G3 ~ ., data = train)


# print(
#   summary(model)
# )

# Interpret the Model
res <- residuals(model)
res <- as.data.frame(res)

# print(
#   ggplotly(
#     ggplot(res, aes(res)) + geom_histogram(fill='blue', alpha=.5)
#   )
# )

# plot(model)

# Predictions

G3.predictions <- predict(model, test)

results <- cbind(G3.predictions, test$G3)
colnames(results) <- c('predicted', 'actual')
results <- as.data.frame(results)
print(head(results))

# Take care of neg values
to_zero <- function(x){
  if (x < 0){
    return(0)
  }else{
    return(x)
  }
}

# Apply Zero Function
results$predicted <- sapply(results$predicted,to_zero)

print('MSE')
mse <- mean((results$actual-results$predicted)^2)
print(mse)

# #RMSE
print('Squared Root of MSE')
print(mse^0.5)

SSE <- sum( (results$predicted - results$actual)^2)
SST <- sum( (mean(df$G3) - results$actual)^2 )

R2 <- 1 - SSE/SST
print('R2')
print(R2)



