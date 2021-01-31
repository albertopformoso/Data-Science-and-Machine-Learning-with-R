v <- c(1, 2, 3)
m <- matrix(1:10, nrow=2)
df <- mtcars

my.list <- list(v, m, df)

print(my.list)

my.named.list <- list(sample.vec = v, 
                      my.matrix = m, 
                      sample.df = df)

print(my.named.list)

print(
  my.list[1]
)

print(
  my.named.list[1]
)
print(
  my.named.list['sample.vec']
)

print(class(my.named.list['sample.vec']))
print(class(my.named.list$sample.vec))
print(class(my.named.list[['sample.vec']]))


double.list <- c(my.named.list, my.named.list)
str(my.named.list)
