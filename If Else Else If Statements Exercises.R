# If Else and Else If Statements

#Example 
x <- 1
if(x==1){
  print("Hello!")
}

# Ex. 1
x <- 2
if(x%%2 == 0){
  print("EVEN")
}else{
  print("NOT EVEN")
}

# Ex. 2
x <- matrix()
if(is.matrix(x)){
  print("Is a MATRIX")
}else{
  print("NOT A MATRIX")
}

# Ex. 3
x <- c(3,7,1)

if(x[1] > x[2]){
 # first second place
   fir <- x[1]
  sec <- x[2]
}else{
  fir <- x[2]
  sec <- x[1]
}

if(x[3] > fir & x[3] > sec){
  # 3rd was largest
  thi <- sec
  sec <- fir
  fir <- x[3]
}else if(x[3] < fir & x[3] < sec){
  # 3rd was smallest
  thi <- x[3]
}else{
  thi <- sec
  sec <- x[3]
}
    
print(paste(fir,sec,thi))  

# Ex. 4

x <- c(20,10,1)

if(x[1] > x[2] & x[1] > x[3]){
  print(x[1])
}else if(x[2] > x[3]){
  print(x[2])
}else{
  print(x[3])
}