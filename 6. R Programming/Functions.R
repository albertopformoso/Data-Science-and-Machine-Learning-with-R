# name_of_func <- function(input1, input2, input3=45){
#   # code execute
#   result <- input1 + input2
#   return(result)
# }

hello <- function(name='Hal 9000'){
  print(paste0('Hello ', name,'!'))
}
hello()
hello('Sam')
cat('\n')

add_num <- function(num1, num2){
  my.sum <- num1 + num2
  return(my.sum)
}
result <- add_num(4, 5)

time5 <- function(num){
  my.result <- num*5
  return(my.result)
}
my.output <- time5(100)
print(my.output)

cat('\n')
v <- "I'm a global variable"
stuff <- "I'm global stuff"
fun <- function(stuff){
  print(v)
  stuff <- "Reassign stuff inside of this function fun"
  print(stuff)
}

fun(stuff)
print(stuff)