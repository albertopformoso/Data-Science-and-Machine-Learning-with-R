df1 <- read.csv('winequality-red.csv',sep=';')
df2 <- read.csv('winequality-white.csv',sep=';')

# Using sapply with anonym functions
df1$label <- sapply(df1$pH, function(x){'red'})
df2$label <- sapply(df2$pH, function(x){'white'})

wine <- rbind(df1,df2)

library(ggplot2)

pl <- ggplot(wine,aes(x=residual.sugar)) + geom_histogram(aes(fill=label),color='black',bins=50)
pl <- pl + scale_fill_manual(values = c('#ae4554','#faf7ea')) + theme_bw()
print(pl)

pl <- ggplot(wine,aes(x=citric.acid)) + geom_histogram(aes(fill=label),color='black',bins=50)
pl <- pl + scale_fill_manual(values = c('#ae4554','#faf7ea')) + theme_bw()
print(pl)

pl <- ggplot(wine,aes(x=alcohol)) + geom_histogram(aes(fill=label),color='black',bins=50)
pl <- pl + scale_fill_manual(values = c('#ae4554','#faf7ea')) + theme_bw()

pl <- ggplot(wine,aes(x=citric.acid,y=residual.sugar)) + geom_point(aes(color=label),alpha=0.2)
pl <- pl + scale_color_manual(values = c('#ae4554','#faf7ea')) +theme_dark()
print(pl)

pl <- ggplot(wine,aes(x=volatile.acidity,y=residual.sugar)) + geom_point(aes(color=label),alpha=0.2)
pl <- pl + scale_color_manual(values = c('#ae4554','#faf7ea')) +theme_dark()
print(pl)

clus.data <- wine[,1:12]

wine.cluster <- kmeans(wine[1:12],2)

print(wine.cluster$centers)

print(
  table(wine$label,wine.cluster$cluster)
)
