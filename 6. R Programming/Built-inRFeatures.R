# Built-in R Features and Functions
print(
  seq(0, 100, by = 10)
)
cat('\n')

v <- c(1, 4, 7, 2, 13, 3, 11)
print(
  sort(v) # ASC order
)
print(
  sort(v, decreasing = T) # DESC order
)
cat('\n')

cv <- c('b', 'd', 'a')
print(
  sort(cv) # Capital letters doesn't matter
)
cat('\n')

print(
  rev(cv) # Reverse elements
)
cat('\n')

print(
  str(mtcars) # structure of an object
)
cat('\n')

v <- 1:10
v2 <- 34:40
print(
  append(v, v2) # Merge objects together
)
cat('\n')

# Checking Data Type
# is.
v <- c(1, 2, 3)
print(
  is.vector(v)
)
print(
  is.vector(mtcars)
)

# as. to convert to another data type
print(
  as.list(v)
)
print(
  as.matrix(v)
)