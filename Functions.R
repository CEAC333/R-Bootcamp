# Functions

## Example of Code
name_of_func <- function(input1,input2,input3=45){
  # Code execute
  result <- input1 + input2
  return(result)
}

sum(c(1,2,3))
help(sum)

# Ex. 1
hello <- function(name){
  print(paste("Hello", name))
}
hello('Sammy')

# Ex. 2
add_num <- function(num1,num2){
  print(num1+num2)
}
add_num(4,5)


# Example 3

add_num <- function(num1,num2){
  my.sum <- num1 + num2
  return(num1+num2)
}


result <- add_num(10,25)
print(result)


# Example 4

times5 <- function(num){
  return(num*5)
}

print(times5(20))

# Example 5

times5 <- function(num){
  my.result <- num * 5
  return(my.result)
}

my.output <- times5(100)

print(my.output)


# Example 6
v <- "I'm a global variable"
stuff <- "I'm global stuff"

fun <- function(stuff){
  print(v)
  stuff <- "Reassign stuff inside of this function fun"
  print(stuff)
}

fun(stuff)
print(stuff)
