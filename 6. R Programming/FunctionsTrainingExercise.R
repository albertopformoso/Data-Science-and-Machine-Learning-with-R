hello_you <- function(name){
  print(paste('Hello', name))
  cat('\n')
}
hello_you('Sam')

hello_you2 <- function(name){
  return(paste('Hello', name))
}
print(hello_you2('Sam'))
cat('\n')

prod <- function(num1, num2){
  return(num1 * num2)
}
print(prod(3, 40))
cat('\n')

num_check <- function(num, v){
  for (ele in v){
    if (ele == num){
      return(T)
    }
  }
  return(F)
}
print(num_check(2, c(1, 2, 3)))
cat('\n')

num_count <- function(num, v){
  count <- 0
  for (ele in v) {
    if(ele == num){
      count <- count + 1
    }
  }
  return(count)
}
print(num_count(2, c(1, 2, 2, 3)))
cat('\n')

# Ex 4: We want to ship bars of aluminum. We will create a function that 
# accepts an integer representing the requested kilograms of aluminum for 
# the package to be shipped. To fullfill these order, we have small bars 
# (1 kilogram each) and big bars (5 kilograms each). Return the least number 
# of bars needed.
# 
# For example, a load of 6 kg requires a minimum of two bars 
# (1 5kg bars and 1 1kg bars). A load of 17 kg requires a minimum 
# of 5 bars (3 5kg bars and 2 1kg bars).

bar_count <- function(pack){
  # Pack is the kg load to fill up
  amount.of.ones <- pack %% 5
  amount.of.fives <- (pack - amount.of.ones)/5
  return(amount.of.ones + amount.of.fives)
}
print(bar_count(17))
cat('\n')

# Ex 5: Create a function that accepts 3 integer values and returns their sum. 
# However, if an integer value is evenly divisible by 3, then it does not count 
# towards the sum. Return zero if all numbers are evenly divisible by 3. 
# Hint: You may want to use the append() function.

summer <- function(a, b, c){
  out <- c(0)
  
  if (a%%3 != 0){
    out <- append(a, out)
  }
  if (b%%3 != 0){
    out <- append(b, out)
  }
  if (c%%3 != 0){
    out <- append(c, out)
  }
  return(sum(out))
}
print(summer(1, 3, 1))
cat('\n')

# Ex 6: Create a function that will return TRUE if an input integer is prime. 
# Otherwise, return FALSE. You may want to look into the any() function.

prime_check <- function(num){
  if (num==2){
    return(T)
  }
  for (x in 2:(num-1)) {
    if (num%%x == 0){
      return(F)
    }
  }
  return(T)
}
print(prime_check(4))
print(prime_check(7))