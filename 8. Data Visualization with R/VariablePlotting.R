library(ggplot2)
library(ggplot2movies)

pl <- ggplot(movies, 
             aes(x = year, y = rating))

pl2 <- pl + geom_bin2d(binwidth=c(3, 1))

# install.packages('hexbin')
pl2 <- pl + geom_hex()

pl2 <- pl + geom_density2d()

pl3 <- pl2 + scale_fill_gradient(high = 'red', low = 'blue')

print(pl3)
