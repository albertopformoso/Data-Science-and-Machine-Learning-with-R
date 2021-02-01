x <- 2

if (x%%2  == 0){
  print('Even number')
}else{
  print('Odd number')
}

x <- matrix()

if (is.matrix(x)){
  print('Is a matrix')
}else{
  print('Not a matrix')
}

x <- c(3, 7, 1)

if (x[1] > x[2]){
  # fist second place
  fir <- x[1]
  sec <- x[2]
}else{
  fir <- x[2]
  sec <- x[1]
}

if (x[3] > fir & x[3] > sec){
  # if 3rd was largest
  thi <- sec
  sec <- fir
  fir <- x[3]
}else if (x[3] < fir & x[3] < sec){
  # erd was smallest
  thi <- x[3]
}else{
  thi <- sec
  sec <- x[3]
}

print(paste(fir, sec, thi))


x <- c(20, 10, 1)
if (x[1] > x[2] & x[1] > x[3]){
  print(x[1])
}else if(x[2] > x[3]){
  print(x[2])
}else{
  print(x[3])
}
