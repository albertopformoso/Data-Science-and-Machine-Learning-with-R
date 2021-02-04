# install.packages('tidyr')
# install.packages('data.table')
library(tidyr)
library(data.table)

# gather() collapse columns into key: value
comp <- c(1,1,1,2,2,2,3,3,3)
yr <- c(1998,1999,2000,1998,1999,2000,1998,1999,2000)
q1 <- runif(9, min=0, max=100)
q2 <- runif(9, min=0, max=100)
q3 <- runif(9, min=0, max=100)
q4 <- runif(9, min=0, max=100)

df <- data.frame(comp=comp,year=yr,Qtr1 = q1,Qtr2 = q2,Qtr3 = q3,Qtr4 = q4)

print(
  gather(df, Quarter, Revenue, Qtr1:Qtr4) # like python melt
)
# df %>% gather(Quarter, Revenue, Qtr1:Qtr4)

stocks <- data.frame(
  time = as.Date('2009-01-01') + 0:9,
  X = rnorm(10, 0, 1),
  Y = rnorm(10, 0, 2),
  Z = rnorm(10, 0, 4)
)
print(stocks)

stocks.gathered <- stocks %>% gather(stock, price, X:Z)

print(stocks.gathered)

print(
  stocks.gathered %>% spread(stock, price)
)

df <- data.frame(new.col = c(NA, "a.x", "b.y", "c.z"))
print(df)

print( # By defaut it separates by non alphanuperic values
  separate(df, new.col, c('ABC', 'XYZ'))
)


df <- data.frame(new.col = c(NA, "a-x", "b-y", "c-z"))
print(df)
print( # By defaut it separates by non alphanuperic values
  separate(data=df, col = new.col, into = c('abc', 'xyz'), sep='-')
)


df.sep <- separate(data=df, col = new.col, into = c('abc', 'xyz'), sep='-')
print(
  unite(df.sep, 'new.joined.col', 'abc', 'xyz', sep = '.')
)

