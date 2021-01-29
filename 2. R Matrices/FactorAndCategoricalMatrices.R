# Factor and Categorical Matrices
animal <- c('d', 'c', 'd', 'c', 'c')
id <- c(1, 2, 3, 4 ,5)

fact.ani <- factor(animal)
print(fact.ani)

ord.cat <- c('cold', 'med', 'hot')
temps <- c('cold', 'med', 'hot', 'hot', 'hot', 'cold', 'med')

fact.temp <- factor(temps, ordered=T, levels=ord.cat)
print(fact.temp)

print(
  summary(fact.temp)
)

print(
  summary(temps)
)