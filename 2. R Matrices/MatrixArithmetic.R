# Matrix Arithmetic

mat <- matrix(1:25, byrow=T, nrow=5)
print(mat*2)

print(
  mat > 15
)

print(
  mat[mat>15]
)

print(
  mat/mat
)

print(
  mat %% 14
)

print(
  mat %*% mat # Linear Algebra Matrix Multiplication
)