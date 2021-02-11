library(ggplot2)
library(ggthemes)
library(dplyr)

bike <- read.csv('bikeshare.csv')

## EDA (Exploratory Data Analysis) ---------------------
# pl <- ggplot(data = bike, aes(x = temp,
#                               y = count))
# 
# pl <- pl + geom_point(alpha = 0.3, 
#                       aes(color = temp))
# 
# print(pl)

# Convert to POSIXct()
bike$datetime <- as.POSIXct(bike$datetime, format='%Y-%m-%d %H:%M:%S')

# pl2 <- ggplot(bike, aes(datetime, count))
# pl2 <- pl2 + geom_point(alpha = 0.5,
#                         aes(color = temp))
# pl2 <- pl2 + scale_color_continuous(low='#55D8CE',
#                                     high='#FF6E2E') + theme_bw()
# 
# print(pl2)
# 
# pl3 <- ggplot(bike, 
#               aes(factor(season), count)) + geom_boxplot(aes(color=factor(season))) + theme_bw()
# 
# print(pl3)

# Feature Engineering
bike$hour <- sapply(
  bike$datetime, function(x){format(x, '%H')}
)
bike$hour <- sapply(bike$hour, as.numeric)

# Scatterplot
pl4 <- ggplot(filter(bike, workingday==1),
              aes(hour, count))
pl4 <- pl4 + geom_point(aes(color = temp),
                        position = position_jitter(w=1, h=0),
                        alpha = 0.5)
pl4 <- pl4 + scale_color_gradientn(colours = c('dark blue','blue','light blue','light green','yellow','orange','red'))
pl4 <- pl4 + theme_bw()
print(pl4)


## Build Model
temp.model <- lm(count ~ temp, bike) # I will try to predict count with temp feature

# print(summary(temp.model))

# How many bike rental counts at 25 C?
# 6.0462 + 9.17*25

temp.test <- data.frame(temp=c(25))
prediction <- predict(temp.model, temp.test)
print(prediction)
