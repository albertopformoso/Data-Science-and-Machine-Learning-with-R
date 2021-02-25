# install.packages('MASS')
library(MASS)

set.seed(101)
data <- Boston

# install.packages('neuralnet',repos = 'http://cran.us.r-project.org')
library(neuralnet)

maxs <- apply(data, 2, max)
mins <- apply(data, 2, min)

print(maxs)
print(mins)

scaled <- as.data.frame(scale(data, center = mins, scale = maxs - mins))
print(
  head(scaled)
)

library(caTools)
split = sample.split(scaled$medv, SplitRatio=0.70)

train = subset(scaled, split == TRUE)
test = subset(scaled, split == FALSE)

n <- names(train)

f <- as.formula(paste("medv ~", paste(n[!n %in% "medv"], collapse="+")))

nn <- neuralnet(f, data=train, hidden=c(5, 3), linear.output=T)

# plot(nn)

predicted.nn.values <- compute(nn, test[1:13])

# Convert back to non-scaled predictions
true.predictions <- predicted.nn.values$net.result*(max(data$medv)-min(data$medv))+min(data$medv)

# Convert the test data
test.r <- (test$medv)*(max(data$medv)-min(data$medv))+min(data$medv)

MSE.nn <- sum((test.r - true.predictions)^2)/nrow(test)

print(MSE.nn)

error.df <- data.frame(test.r,true.predictions)
print(
  head(error.df)
)

library(ggplot2)
pl <- ggplot(error.df,aes(x=test.r,y=true.predictions)) + geom_point() + stat_smooth()
print(pl)