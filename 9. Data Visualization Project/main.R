library(ggplot2)
library(ggthemes)
library(data.table)

pointsToLabel <- c("Russia", "Venezuela", "Iraq", "Myanmar", "Sudan",
                   "Afghanistan", "Congo", "Greece", "Argentina", "Brazil",
                   "India", "Italy", "China", "South Africa", "Spane",
                   "Botswana", "Cape Verde", "Bhutan", "Rwanda", "France",
                   "United States", "Germany", "Britain", "Barbados", "Norway", "Japan",
                   "New Zealand", "Singapore")

df <- fread('data/Economist_Assignment_Data.csv', 
            drop = 1)

pl <- ggplot(df,
             aes(x = CPI, y = HDI, color = factor(Region)))

pl <- pl + geom_point(size = 4,
                      shape = 1)

pl <- pl + geom_smooth(aes(group = 1),
                       method = 'lm',
                       formula = y~log(x),
                       se = F,
                       color = 'red') # Adding Trendline

pl <- pl + geom_text(aes(label = Country), 
                     color = "gray20",
                     data = subset(df, Country %in% pointsToLabel),
                     check_overlap = TRUE)

pl <- pl + scale_x_continuous(limits = c(0.9, 10, 0.5),
                              breaks = 1:10)

pl <- pl + theme_economist_white()

print(pl)

