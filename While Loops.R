# While Loops

x <- 0

while(x<10){
  print(paste0('x is: ',x))

  
  x <- x+1
  if(x==10){
    print("X is now equal to 10! Break loop!")
    break
    print("Woo I printed too!")
  }
}

# 5
x <- 0

while(x<10){
  print(paste0('x is: ',x))
  
  
  x <- x+1
  if(x==5){
    print("X is now equal to 5! Break loop!")
    break
  }
}


### For Loops
v <- c(1,2,3)

for(variable in v){
  print(variable)
  
}

v<- c(1,2,3,4,5)

for(temp.var in v){
  # Execute some code
  # for every temp.var in v
  print(temp.var)
}


v <- c(1,2,3,4,5)

for(temp.var in v){
  result <- temp.var + 1
  print('The temp.var plus 1 is equal to:')
  print(result)
}


my.list <- list(c(1,2,3), mtcars,12)

for(item in my.list){
  print(item)
  
}

mat <- matrix(1:25,nrow=5)

for(num in mat){
  print(num)
}

mat <- matrix(1:25,nrow = 5)

for(row in 1:nrow(mat)) {
  for(col in 1:ncol(mat)) {
    print(paste('The selected row is:' , row))
    print(paste('The element at row:' , row, 'and col: ', 'is',mat[row,col]))
  }
}
mat