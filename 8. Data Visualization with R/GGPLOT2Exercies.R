library(ggplot2)

pl <- ggplot(data = mpg,
             aes(x = hwy)) + geom_histogram(fill = 'salmon',
                                            bins = 20)

print(pl)

pl <- ggplot(data = mpg,
             aes(x = manufacturer))

pl <- pl + geom_bar(aes(fill=factor(cyl))) 

print(pl)

pl <- ggplot(data = txhousing,
             aes(x = sales, y = volume)) + geom_point(color = 'blue',
                                                      alpha = 0.1)

pl <- pl + geom_smooth(color = 'salmon')

print(pl)