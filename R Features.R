# Built-In R Features

## Seq
seq(0,100,by=10)
seq(0,10,by=2)
help("seq")

## Sort
v <- c(1,4,7,2,13,3,11)
v
sort(v)
sort(v,decreasing=TRUE)
cv <- c('b','d','a')
cv
sort(cv)
cv <- c('b','d','a','c')
cv
sort(cv)

## Rev
v<- 1:10
v
rev(v)
str(v)
str(mtcars)
summary(mtcars)


## Append

v1 <- 1:10
v2 <- 35:40
v
append(v,v2)


## Checking Data Type
v <- c(1,2,3)
is.vector(v)
is.data.frame(v)
is.data.frame(mtcars)

## as.
v
as.list(v)

as.matrix(v) # Converting


### Apply

sample(x = 1:100, 3)
1:10

v <- c(1,2,3,4,5)
addrand <- function(x){
  ran <- sample(1:100,1)
  return(x+ran)
}
print(addrand(10))


result <- lapply(v,addrand)
print(result)

v <- 1:5

times2 <- function(num){
  return(num*2)
}
print(v)


result <- sapply(v,times2)

print(result)



### Anonymous Functions

v <- 1:5

times2 <- function(num){num*2}


result <- sapply(v,function(num){num*2})
print(result)

### Apply with Multiple Inputs
v <- 1:5


add_choice <- function(num,choice){
  return(num+choice)
}

print(add_choice(2,10))

print(sapply(v,add_choice,choice=100))