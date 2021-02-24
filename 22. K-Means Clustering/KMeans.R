library(datasets)
library(ggplot2)
print(
 ggplot(iris, aes(Petal.Length, Petal.Width, color = Species)) + geom_point()
)

set.seed(101)
irisCluster <- kmeans(iris[, 1:4], 3, nstart = 20)
irisCluster

print(
  table(irisCluster$cluster, iris$Species)
)

library(cluster)
clusplot(iris, irisCluster$cluster, color=TRUE, shade=TRUE, labels=0,lines=0, )