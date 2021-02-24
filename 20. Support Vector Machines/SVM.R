library(ISLR)
# install.packages('e1071',repos = 'http://cran.us.r-project.org')
library(e1071)

model <- svm(Species ~ ., data=iris)

print(summary(model))

predicted.values <- predict(model,iris[1:4])

print(
  table(predicted.values,iris[,5])
)

tune.results <- tune(svm,train.x=iris[1:4],train.y=iris[,5],kernel='radial',
                       ranges=list(cost=10^(-1:2), gamma=c(.5,1,2)))


print(
  summary(tune.results)
)

tuned.svm <- svm(Species ~ ., data=iris, kernel="radial", cost=1, gamma=0.5)

print(
  summary(tuned.svm)
)

tuned.predicted.values <- predict(tuned.svm,iris[1:4])

print(
  table(tuned.predicted.values,iris[,5])
)