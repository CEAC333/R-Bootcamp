# Functions Exercise

# Example 1:
hello_you <- function(name){
  print(paste('Hello',name))
}
hello_you('Sam')

# Example 2:
hello_you2 <- function(name){
  return(paste('Hello',name))
}
print(hello_you2('Sam'))


# Exercise 1: Product of two integers

prod <- function(num1,num2){
  return(num1*num2)
}
print(prod(3,4))


# Exercise 2: Vector Integers

num_check<- function(num,v){
  for (ele in v){
    if (ele == num){
      return(TRUE)
    }
  }
  return(FALSE)
}
print(num_check(2,c(1,2,3)))

# Exercise 3: Function accepts two arguments

num_count <- function(num,v){
  count <- 0
  for (ele in v){
    if(ele == num){
      count <- count + 1
    }
  }
  return(count)
}
print(num_count(2,c(2,2,2)))


# Exercise 4: Shipping Bars of Aluminum
# How many 5kg bars can we use?
# How many 1kg bars to fill the gap?

# How many times does 5 go into the required load number?
# The remainder will be the number of 1kg bar


bar_count <- function(pack){
  # Pack is the kg load to fill up
  amount.of.ones <- pack %% 5
  amount.of.fives <- (pack - amount.of.ones)/5
  return(amount.of.ones+amount.of.fives)
}
print(bar_count(17))


# Exercise 5: 3 Integer Values

summer <- function(a,b,c){
  out <- c(0)
  
  if(a%%3 != 0){
    out <- append(a,out)
  }
  if(b%%3 != 0){
    out <- append(b,out)
  }
  if(c%%3 != 0){
    out <- append(c,out)
  }
  
  return(sum(out))
}

print(summer(1,6,1))


# Exercise 6: Return True or False

prime_check <- function(num){
  if(num==2){
    return(TRUE)
  }
  for(x in 2:(num-1)){
    if(num%%x == 0){
      return(FALSE)
    }
  }
  return(TRUE)
}
print(prime_check(22533))


