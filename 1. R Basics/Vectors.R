# Vectors

nvec <- c(1, 2, 3, 4, 5)
print(class(nvec))

cvec <- c('U', 'S', 'A')
print(class(cvec))

lvec <- c(T, F)
print(class(lvec))

v <- c(T, 20, 40)
print(v)
print(class(v))

v <- c('USA', 20, 31)
print(v)
print(class(v))

# Vector Names
temps <- c(72, 71, 68, 73, 69, 75, 76)
days <- c('Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun')
names(temps) <- days
print(temps)