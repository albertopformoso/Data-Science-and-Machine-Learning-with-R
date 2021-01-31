Name <- c('Sam', 'Frank', 'Amy')
Age <- c(22, 25, 26)
Weight <- c(150, 165, 120)
Sex <- c('M', 'M', 'F')

df <- data.frame(row.names = Name, Age, Weight, Sex)
print(df)

print('Is mtcars a dataframe?')
print(
  is.data.frame(mtcars)
)

mat <- matrix(1:25, nrow = 5)
print(
  as.data.frame(mat)
)

df2 <- mtcars
print(
  head(df2, 6)
)

print(
  round(mean(df2$mpg), 2)
)

print(
  df2[df2$cyl == 6,]
)
subset(df2, cyl == 6)

print(
  head(
    df2[,c('am', 'gear', 'carb')]
  )
)

df2$performance <- df2$hp / df2$wt

df2$performance <- round(df2$performance, 2)
print(
  head(
    df2
  )
)

print(
  mean(subset(df2, hp > 100 & wt > 2.5)$mpg)
)
print(
  mean(df2[(df2$hp > 100) & (df2$wt > 2.5),]$mpg)
)

print(
  df2['Hornet Sportabout', ]$mpg
)
