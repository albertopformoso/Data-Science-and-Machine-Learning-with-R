df <- read.csv('bank_note_data.csv')

library(caTools)
set.seed(101)
split = sample.split(df$Class, SplitRatio = 0.70)

train = subset(df, split == TRUE)
test = subset(df, split == FALSE)

library(neuralnet)

nn <- neuralnet(Class ~ Image.Var + Image.Skew + Image.Curt + Entropy,data=train,hidden=10,linear.output=FALSE)

predicted.nn.values <- compute(nn,test[,1:4])

print(
  head(predicted.nn.values$net.result)
)

predictions <- sapply(predicted.nn.values$net.result,round)

head(predictions)

print(
  table(predictions,test$Class)
)
