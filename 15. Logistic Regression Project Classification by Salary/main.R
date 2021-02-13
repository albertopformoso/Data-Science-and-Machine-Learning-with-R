library(dplyr)
library(ggplot2)

adult <- read.csv('adult_sal.csv') 
adult <- select(adult, -X)

### DATA CLEANING ###

# Combine employer type
unemp <- function(job){
  job <- as.character(job)
  
  if (job == 'Never-worked' | job == 'Without-pay'){
    return('Unemployed')
  }else{
    return(job)
  }
}

adult$type_employer <- sapply(adult$type_employer, unemp)

group_emp <- function(job){
  if (job=='Local-gov' | job=='State-gov'){
    return('SL-gov')
  }else if (job=='Self-emp-inc' | job=='Self-emp-not-inc'){
    return('self-emp')
  }else{
    return(job)
  }
}

adult$type_employer <- sapply(adult$type_employer,group_emp)

# Reduce to three groups
# married, not-married, never-married
group_marital <- function(mar){
  mar <- as.character(mar)
  
  # Not-Married
  if (mar=='Separated' | mar=='Divorced' | mar=='Widowed'){
    return('Not-Married')
    
    # Never-Married   
  }else if(mar=='Never-married'){
    return(mar)
    
    #Married
  }else{
    return('Married')
  }
}

adult$marital <- sapply(adult$marital,group_marital)

# Group countries together
Asia <- c('China','Hong','India','Iran','Cambodia','Japan', 'Laos' ,
          'Philippines' ,'Vietnam' ,'Taiwan', 'Thailand')

North.America <- c('Canada','United-States','Puerto-Rico' )

Europe <- c('England' ,'France', 'Germany' ,'Greece','Holand-Netherlands','Hungary',
            'Ireland','Italy','Poland','Portugal','Scotland','Yugoslavia')

Latin.and.South.America <- c('Columbia','Cuba','Dominican-Republic','Ecuador',
                             'El-Salvador','Guatemala','Haiti','Honduras',
                             'Mexico','Nicaragua','Outlying-US(Guam-USVI-etc)','Peru',
                             'Jamaica','Trinadad&Tobago')
Other <- c('South')

group_country <- function(ctry){
  if (ctry %in% Asia){
    return('Asia')
  }else if (ctry %in% North.America){
    return('North.America')
  }else if (ctry %in% Europe){
    return('Europe')
  }else if (ctry %in% Latin.and.South.America){
    return('Latin.and.South.America')
  }else{
    return('Other')      
  }
}

adult$country <- sapply(adult$country,group_country)

adult$type_employer <- sapply(adult$type_employer,factor)
adult$country <- sapply(adult$country,factor)
adult$marital <- sapply(adult$marital,factor)

### MISSING DATA ###
library(Amelia)
adult[adult == '?'] <- NA

adult$type_employer <- sapply(adult$type_employer,factor)
adult$country <- sapply(adult$country,factor)
adult$marital <- sapply(adult$marital,factor)
adult$occupation <- sapply(adult$occupation,factor)
adult$income <- sapply(adult$income,factor)

# missmap(adult)

# missmap(adult,y.at=c(1),y.labels = c(''),col=c('yellow','black'))

adult <- na.omit(adult)

# missmap(adult,y.at=c(1),y.labels = c(''),col=c('yellow','black'))

## EDA ##

print(
  ggplot(adult,aes(age)) + geom_histogram(aes(fill=income),color='black',binwidth=1) + theme_bw()
)

print(
  ggplot(adult,aes(hr_per_week)) + geom_histogram() + theme_bw()
)

names(adult)[names(adult)=="country"] <- "region"

print(
  ggplot(adult,aes(region)) + geom_bar(aes(fill=income),color='black')+theme_bw()+theme(axis.text.x = element_text(angle = 90, hjust = 1))
)

# Building Model
## LOGISTIC REGRESSION ##
library(caTools)
set.seed(101)

sample <- sample.split(adult$income, SplitRatio = 0.70)

train <- subset(adult, sample == T)
test <- subset(adult, sample == F)

model <- glm(income ~  . , family = binomial(link = 'logit'), data = train)

print(
  summary(model)
)

new.step.model <- step(model)

print(
  summary(new.step.model)
)

test$predicted.income = predict(model, newdata=test, type="response")

print(
  table(test$income, test$predicted.income > 0.5)
)

print('accuracy of the model:')
print(
  (6372+1423)/(6372+1423+548+872)
)

print('recall:')
print(
  6732/(6372+548)
)

print('precision:')
print(
  6732/(6372+872)
)