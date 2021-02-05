library(ggplot2)
df <- mpg

pl <- ggplot(data = df,
             aes(x = class))

pl2 <- pl + geom_bar(aes(fill =drv),
                     position = 'dodge') # Separate the bars

pl2 <- pl + geom_bar(aes(fill =drv),
                     position = 'fill') # By %

print(pl2)
