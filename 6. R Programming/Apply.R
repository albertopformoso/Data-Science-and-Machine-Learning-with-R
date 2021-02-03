print(sample(x = 1:10, 1)) # get a random number from 1 to 10
print(sample(x = 1:10, 3)) # get 3 random number from 1 to 10
cat('\n')

v <- c(1, 2, 3, 4, 5)
addrand <- function(x){
  ran <- sample(1:100, 1)
  return(x + ran)
}

result <- lapply(v, addrand) # returns a list
print(result)

result <- sapply(v, addrand) # returns a vector
print(result)
cat('\n')

v <- 1:5
times2 <- function(num){
  return(num*2)
}
result <- sapply(v, times2)
print(result)

# Anonymous Functions
result <- sapply(v, function(num){num*2})
print(result)

# Apply with multiple inputs
add_choice <- function(num, choice){
  return(num * 2 + choice)
}
print(
  sapply(v, add_choice, choice=100)
)