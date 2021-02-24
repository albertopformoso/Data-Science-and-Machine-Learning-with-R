library(ISLR)
library(ggplot2)

print(
  head(College)
)

df <- College

print(
  ggplot(df, aes(Room.Board, Grad.Rate)) + geom_point(aes(color=Private))
)

print(
  ggplot(df, aes(F.Undergrad)) + 
    geom_histogram(aes(fill=Private), color='black', bins=50)
)

print(
  ggplot(df, aes(Grad.Rate)) + 
    geom_histogram(aes(fill=Private), color='black', bins=50)
)

# What college had a Graduation Rate of above 100%
print(subset(df, Grad.Rate > 100))

# Change that college's grad rate to 100%
df['Cazenovia College','Grad.Rate'] <- 100


library(caTools)
set.seed(101)

sample = sample.split(df$Private, SplitRatio = 0.70)
train = subset(df, sample == T)
test = subset(df, sample == F)

# DECISION TREE
library(rpart)
tree <- rpart(Private ~.,method='class',data = train)

tree.preds <- predict(tree,test)

print(
  head(tree.preds)
)

tree.preds <- as.data.frame(tree.preds)

joiner <- function(x){
  if (x>=0.5){
    return('Yes')
  }else{
    return("No")
  }
}

tree.preds$Private <- sapply(tree.preds$Yes,joiner)

print(
  head(tree.preds)
)

print(
  table(tree.preds$Private,test$Private)
)

library(rpart.plot)
prp(tree)


## RANDOM FOREST
library(randomForest)

rf.model <- randomForest(Private ~ . , data = train,importance = TRUE)

print(
  rf.model$confusion
)

print(
  rf.model$importance
)

p <- predict(rf.model,test)


print(
  table(p,test$Private)
)