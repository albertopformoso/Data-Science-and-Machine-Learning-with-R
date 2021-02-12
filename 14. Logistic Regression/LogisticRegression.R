library(Amelia)
library(ggplot2)

df.train <- read.csv('titanic_train.csv')

missmap(df.train, main = 'Missing Map', 
        col = c('yellow', 'black'), legend = F)

pl <- ggplot(df.train, aes(Survived)) + geom_bar()
print(pl)

pl2 <- ggplot(df.train, aes(Pclass)) + geom_bar(aes(fill=factor(Pclass)))
print(pl2)

pl3 <- ggplot(df.train, aes(Sex)) + geom_bar(aes(fill=factor(Sex)))
print(pl3)

pl4 <- ggplot(df.train, aes(Age)) + geom_histogram(bins=20, 
                                                   alpha=0.5, 
                                                   fill='blue')
print(pl4)

pl5 <- ggplot(df.train, aes(SibSp)) + geom_bar()
print(pl5)

pl5 <- ggplot(df.train, aes(Fare)) + geom_histogram(fill='green', 
                                                    color='black',
                                                    alpha=0.5)
print(pl5)


# Data Cleaning

pl <- ggplot(df.train, aes(Pclass, Age))
pl <- pl + geom_boxplot(aes(group=Pclass, fill=factor(Pclass), alpha=0.4))
pl <- pl + scale_y_continuous(breaks = seq(min(0), max(80), by=2))
print(pl)

## IMPUTATION OF AGE BASED ON CLASS
impute_age <- function(age, class){
  out <- age
  for (i in 1:length(age)){
    
    if (is.na(age[i])){
      
      if (class[i] == 1){
        out[i] <- 37
        
      }else if (class[i] == 2){
        out[i] <- 29
        
      }else{
        out[i] <- 24
      }
    }else{
      out[i]<-age[i]
    }
  }
  return(out)
}

fixed.ages <- impute_age(df.train$Age, df.train$Pclass)

df.train$Age <- fixed.ages

library(dplyr)
df.train <- select(df.train, -PassengerId, -Name, -Ticket, -Cabin)

df.train$Survived <- factor(df.train$Survived)
df.train$Pclass <- factor(df.train$Pclass)
df.train$Parch <- factor(df.train$Parch)
df.train$SibSp <- factor(df.train$SibSp)

log.model <- glm(Survived ~ . ,
                 family = binomial(link = 'logit'), 
                 data = df.train)

# print(
#   summary(log.model)
# )

library(caTools)
set.seed(101)
split <- sample.split(df.train$Survived, SplitRatio = 0.7)
final.train <- subset(df.train, split == T)
final.test <- subset(df.train, split == F)
final.log.model <- glm(Survived ~ . ,
                       family = binomial(link='logit'),
                       data=final.train)

print(
  summary(log.model)
)

fitted.probabilities <- predict(final.log.model, final.test, type = 'response')
fitted.results <- ifelse(fitted.probabilities > 0.5, 1, 0)

misClassError <- mean(fitted.results != final.test$Survived)

print(1 - misClassError)

# Confusion Matrix
print(
  table(final.test$Survived, fitted.probabilities > 0.5)
)