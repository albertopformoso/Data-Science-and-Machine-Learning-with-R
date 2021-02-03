x <- 0

while (x < 10){
  print(paste0('X is: ', x))
  
  x <- x + 1
  
  if (x == 5){
    print('X is now equal to 5! Break Loop!')
    break
  }
}

