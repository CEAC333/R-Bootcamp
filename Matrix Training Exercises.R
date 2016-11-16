## Matrices Training Exercise

#1

A <- c(1,2,3)
B <- c(4,5,6)
cbind(A,B)
rbind(A,B)

#2

1:9
c(1,2,3)
1:3

#3
mat <- matrix(1:9,byrow = TRUE, nrow = 3)
matrix(1:9,nrow=3)
is.matrix(mat)
is.array(mat)
is.data.frame(mat)


#4
mat2 <- matrix(1:25,byrow=T,nrow=5)
mat2

#5

mat2[2:3,2:3]


#6

mat2[4:5,4:5]


#7

sum(mat2)
colSums(mat2)
rowSums(mat2)

#8

help(runif)
runif(n, min = 0, max = 1)
runif(20)
runif(20,min=0,max=100)
matrix(runif(20),nrow = 4)
