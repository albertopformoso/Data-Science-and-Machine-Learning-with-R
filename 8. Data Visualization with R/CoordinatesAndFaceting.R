library(ggplot2)
df <- mpg

pl <- ggplot(data = df,
             aes(x = displ, y = hwy)) + geom_point()

pl2 <- pl + coord_cartesian(xlim = c(1, 4), ylim = c(15, 30))

pl2 <- pl + coord_fixed(ratio = 1/3)

pl2 <- pl + facet_grid(. ~ cyl)

pl2 <- pl + facet_grid(drv ~ .)

pl2 <- pl + facet_grid(drv ~ cyl)

print(pl2)
