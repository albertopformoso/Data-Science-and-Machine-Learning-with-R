# Matrix Training Exercies

# 1
A <- c(1, 2, 3)
B <- c(4, 5, 6)
print(rbind(A, B))

# 2
mat <-matrix(1:9, byrow=T, nrow=3)
print(mat)

# 3
print(is.matrix(mat))

# 4
mat2 <- matrix(1:25, byrow=T, nrow=5)
print(mat2)

# 5
print(
  mat2[2:3, 2:3]
)

# 6
print(
  mat2[4:5, 4:5]
)

# 7 
print(colSums(mat2))
print(rowSums(mat2))

# 8
print(
  matrix(runif(20), nrow=4)
)