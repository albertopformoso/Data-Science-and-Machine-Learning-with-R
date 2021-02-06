library(ggplot2)
library(plotly)
library(data.table)
library(dplyr)

batting <- read.csv('data/Batting.csv')

# Feature Engineering

# Batting Average
batting$BA <- batting$H / batting$AB

# On Base Percentage
batting$OBP <- (batting$H + batting$BB + batting$HBP)/(batting$AB + batting$BB + batting$HBP + batting$SF)

# Creating X1B (Singles)
batting$X1B <- batting$H - batting$X2B - batting$X3B - batting$HR

# Creating Slugging Average (SLG)
batting$SLG <- ((1 * batting$X1B) + (2 * batting$X2B) + (3 * batting$X3B) + (4 * batting$HR) ) / batting$AB


sal <- read.csv('data/Salaries.csv')

batting <- subset(batting, yearID >= 1985)

# Merging data frames
combo <- merge(batting, sal, by = c('playerID', 'yearID'))

lost_players <- subset(combo, playerID %in% c('giambja01','damonjo01','saenzol01'))

lost_players <- subset(lost_players, yearID == 2001)

lost_players <- lost_players[,c('playerID','H','X2B','X3B','HR','OBP','SLG','BA','AB')]

# REPLACEMENT PLAYERS
# 1469 AB
# AVG 0.364 OBP
# 15 Million

combo <- subset(combo, yearID == 2001)

combo <- subset(combo, salary < 8000000 & OBP > 0)

combo <- subset(combo, AB >= 450)

pl <- ggplot(combo,
             aes(x = OBP, y = salary)) + geom_point(size = 2,
                                                    alpha = 0.5,
                                                    color = 'black')

gpl <- ggplotly(pl)

print(gpl)

options <- head(arrange(combo, desc(OBP)), 10)
print(
  options[, c('playerID', 'AB', 'salary', 'OBP')]
)
