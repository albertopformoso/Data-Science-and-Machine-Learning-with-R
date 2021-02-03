v <- c(1, 2, 3, 4, 5)

for (temp.var in v) {
  print(paste0('Hello ', temp.var))
}

v <- c(1, 2, 3, 4, 5)

for (temp.var in v) {
  result <- temp.var + 1
  print(paste0('The temp.var plus 1 is equal to: ', result))
}


my.list <- list(c(1, 2, 3), head(mtcars), 12)

for (item in my.list) {
  print(item)
}
cat('\n')

mat <- matrix(1:25, nrow=5)

for (row in 1:nrow(mat)){
  for (col in 1:ncol(mat)){
    print(
      paste(
        'The element at row:', row, 'and col:', col, 'is', mat[row, col]
        )
    )
  }
}