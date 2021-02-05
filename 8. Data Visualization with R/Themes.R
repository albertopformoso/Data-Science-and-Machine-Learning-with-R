# install.packages('ggthemes')
library(ggplot2)
library(ggthemes)

# theme_set(theme_minimal())

pl <- ggplot(mtcars,
             aes(x = wt, y = mpg)) + geom_point()

pl2 <- pl + theme_economist()

print(pl2)
