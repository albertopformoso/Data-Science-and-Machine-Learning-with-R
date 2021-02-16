# install.packages('ISLR')
library(ISLR)

purchase <- Caravan[,86]

standardized.caravan <- scale(Caravan[,-86])

# Train Test Split
test.index <- 1:1000
test.data <- standardized.caravan[test.index,]
test.purchase <- purchase[test.index]

# Train
train.data <- standardized.caravan[-test.index,]
train.purchase <- purchase[-test.index]

##############
## KNN MOdel##
##############
library(class)
set.seed(101)

predicted.purchase <- knn(train.data, test.data, train.purchase,
                          k=1)

misclass.error <- mean(test.purchase != predicted.purchase)

print(misclass.error)


## CHOOSING A K VALUE

# K ELBOW
predicted.purchase <- NULL
error.rate <- NULL

for (i in 1:20){
  set.seed(101)
  predicted.purchase <- knn(train.data, test.data, train.purchase,
                            k=i)
  error.rate[i] <- mean(test.purchase != predicted.purchase)
}

print(error.rate)

# Visualizing K Elbow
library(ggplot2)
k.values <- 1:20
error.df <- data.frame(error.rate, k.values)

print(
  ggplot(error.df, aes(k.values, error.rate)) + 
    geom_point() + geom_line(lty='dotted', color='red')
)
