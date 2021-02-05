library(ggplot2)
df <- mtcars

pl <- ggplot(data = df,
             aes(x = factor(cyl), y = mpg))

pl2 <- pl + geom_boxplot() + coord_flip()

pl2 <- pl + geom_boxplot(aes(fill=factor(cyl))) + theme_bw()

print(pl2)
