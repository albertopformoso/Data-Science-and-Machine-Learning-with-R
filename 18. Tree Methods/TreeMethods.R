## DECISION TREE

# install.packages('rpart')
library(rpart)

tree <- rpart(Kyphosis ~ . , method='class', data=kyphosis)
printcp(tree)

# Tree Visualization
plot(tree, uniform=T, main='Main Title')
text(tree, use.n=T, all=T)

# install.packages('rpart.plot')
library(rpart.plot)

prp(tree)

## RANDOM FOREST
install.packages('randomForest')
library(randomForest)

model <- randomForest(Kyphosis ~ .,   data=kyphosis)

print(importance(model))